import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
    
class HomePage extends StatelessWidget {

  const HomePage({ super.key });
  
  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicasAppBar(
        actions: [
          PopupMenuButton(
            child: const IconPopupMenu(),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(value: 1, child: Text("Iniciar terminal")),
                const PopupMenuItem(value: 2, child: Text("Finalizar terminal")),
              ];
            },
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.only(top: 112),
          padding: const EdgeInsets.all(40),
          width: sizeOf.width * .8,
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: LabClinicasTheme.orangeColor)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Bem vindo!", style: LabClinicasTheme.titleStyle,),
              const SizedBox(height: 32,),
              SizedBox(
                width: sizeOf.width*.8,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacementNamed("/self-service");
                  }, 
                  child: const Text("Iniciar terminal")
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}