/*
 * Copyright (C) 2018 The LineageOS Project
 * Copyright (C) 2019 CypherOS
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package co.aospa.device;

import android.content.Context;
import android.media.AudioManager;
import android.os.Vibrator;
import android.os.VibrationEffect;
import android.view.KeyEvent;
import android.util.Log;
import android.text.TextUtils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.BufferedReader;
import java.io.FileReader;

import java.util.ArrayList;
import java.util.List;

import com.android.internal.os.DeviceKeyHandler;

public class TriStateHandler implements DeviceKeyHandler {

    private static final String TAG = "KeyHandler";
    private static final boolean DEBUG = true;

    private static final boolean sIsOnePlus7 = android.os.Build.PRODUCT.equals("OnePlus7");
    private static final boolean sIsOnePlus7t = android.os.Build.PRODUCT.equals("OnePlus7T");

    // Slider key codes
    private static final int MODE_NORMAL = 601;
    private static final int MODE_VIBRATION = 602;
    private static final int MODE_SILENCE = 603;

    private static AudioManager mAudioManager;
    private static Context mContext;
    private static Vibrator mVibrator;

    private static final String TRI_STATE_CALIB_DATA = "/mnt/vendor/persist/engineermode/tri_state_hall_data";
    private static final String TRI_STATE_CALIB_PATH = "/sys/bus/platform/devices/soc:tri_state_key/hall_data_calib";

    public TriStateHandler(Context context) {
        mContext = context;

        mAudioManager = mContext.getSystemService(AudioManager.class);
        mVibrator = mContext.getSystemService(Vibrator.class);

       if (sIsOnePlus7 || sIsOnePlus7t) {
            initTriStateHallSensor();
        }

    }

    public KeyEvent handleKeyEvent(KeyEvent event) {
        final int scanCode = event.getScanCode();
        final int currentRingerMode = mAudioManager.getRingerModeInternal();

        switch (scanCode) {
            case MODE_NORMAL:
                if (currentRingerMode != AudioManager.RINGER_MODE_NORMAL) {
                    doHapticFeedback(VibrationEffect.EFFECT_DOUBLE_CLICK);
                    mAudioManager.setRingerModeInternal(AudioManager.RINGER_MODE_NORMAL);
                } else {
                    return event;
                }
                break;
            case MODE_VIBRATION:
                if (currentRingerMode != AudioManager.RINGER_MODE_VIBRATE) {
                    doHapticFeedback(VibrationEffect.EFFECT_THUD);
                    mAudioManager.setRingerModeInternal(AudioManager.RINGER_MODE_VIBRATE);
                } else {
                    return event;
                }
                break;
            case MODE_SILENCE:
                if (currentRingerMode != AudioManager.RINGER_MODE_SILENT) {
                    doHapticFeedback(VibrationEffect.EFFECT_POP);
                    mAudioManager.setRingerModeInternal(AudioManager.RINGER_MODE_SILENT);
                } else {
                    return event;
                }
                break;
            default:
                return event;
        }

        return null;
    }

    private void doHapticFeedback(int effect) {
        if (mVibrator != null) {
            if (mVibrator.hasVibrator()) {
                mVibrator.vibrate(VibrationEffect.get(effect));
            }
        }
    }

    private void initTriStateHallSensor() {
        String calibData = getFileValue(TRI_STATE_CALIB_DATA, "0,0;0,0;0,0");
        if (DEBUG) Log.i(TAG, "calibData = " + calibData);
        String[] pairs = calibData.split(";");
        List<String> valueList = new ArrayList<>();
        for (String pair : pairs) {
            String[] valuePair = pair.split(",");
            String lowValue = valuePair[0];
            valueList.add(lowValue);
            String hightValue = valuePair[1];
            valueList.add(hightValue);
        }
        String calibDataString = TextUtils.join(",", valueList);
        if (DEBUG) Log.i(TAG, "calibDataString = " + calibDataString);
        writeValue(TRI_STATE_CALIB_PATH, calibDataString);
    }

    /**
     * Write a string value to the specified file.
     * @param filename      The filename
     * @param value         The value
     */
    public static void writeValue(String filename, String value) {
        if (filename == null) {
            return;
        }
        try {
            FileOutputStream fos = new FileOutputStream(new File(filename));
            fos.write(value.getBytes());
            fos.flush();
            fos.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getFileValue(String filename, String defValue) {
        String fileValue = readLine(filename);
        if(fileValue!=null){
            return fileValue;
        }
        return defValue;
    }

    public static String readLine(String filename) {
        if (filename == null) {
            return null;
        }
        BufferedReader br = null;
        String line = null;
        try {
            br = new BufferedReader(new FileReader(filename), 1024);
            line = br.readLine();
        } catch (IOException e) {
            return null;
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    // ignore
                }
            }
        }
        return line;
    }

}
