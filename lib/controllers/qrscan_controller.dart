import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:flutter/services.dart';

class QRScanController extends GetxController{
  var result = ' ';
  Future scanQR() async{
    try{
      ScanResult qrScanResult = await BarcodeScanner.scan();
      String qrResult = qrScanResult.rawContent;
      if (qrResult == '-1'){
        result = "Cancelado";
      }
      else{
        result = qrResult;
        print(result);
        update();
      }      
    }
    on PlatformException catch(e){
      if(e.code == BarcodeScanner.cameraAccessDenied){
        print('El permiso de cámara ha sido denegada');
        result = "El permiso de cámara ha sido denegada";        
      } else {
        result = "Error desconocido $e";
      }
    } 
    on FormatException{
      result = "Presionaste el botón de regreso antes de escanear cualquier cosa";
    }
    catch(e){
      result = "Error desconocido $e";
    }
  }
}

