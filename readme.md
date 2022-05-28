## DCA1000EVM bin文件解析程序

### 官方解析文件

rawDataReader.m 官方解析文件，需要相对应的修改68xx.setup.json中的一些路径，如下所示

```json
"configUsed": "D:\\ti\\studio\\mmwave_studio_02_01_01_00\\mmWaveStudio\\JSONSampleFiles\\68xx\\68xx.mmwave.json",

"radarSSFirmware": "D:\\ti\\studio\\mmwave_studio_02_01_01_00\\rf_eval_firmware\\radarss\\xwr68xx_radarss.bin",
    "masterSSFirmware": "D:\\ti\\studio\\mmwave_studio_02_01_01_00\\rf_eval_firmware\\masterss\\xwr68xx_masterss.bin"

"fileBasePath": "C:\\Users\\11930\\Desktop\\TI_Analyse\\TI_Analyse",
"files": [
      {
        "processedFileName": "data1_8.5.bin",
        "processedFileSummary": {
          "numZeroFillBytes": 0
        }
      }
    ]
```

### 简易解析文件

TI_adcData_analysis_main.m 为建议的解析文件，适用于 IWR6843 的芯片