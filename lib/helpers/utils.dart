import 'dart:io';

class Utils {
  static String monthsInYear(int month) {
    String formattedMonth;
    switch (month) {
      case 1:
        formattedMonth = 'Janeiro';
        break;
      case 2:
        formattedMonth = 'Fevereiro';
        break;
      case 3:
        formattedMonth = 'Março';
        break;
      case 4:
        formattedMonth = 'Abril';
        break;
      case 5:
        formattedMonth = 'Maio';
        break;
      case 6:
        formattedMonth = 'Junho';
        break;
      case 7:
        formattedMonth = 'Julho';
        break;
      case 8:
        formattedMonth = 'Agosto';
        break;
      case 9:
        formattedMonth = 'Setembro';
        break;
      case 10:
        formattedMonth = 'Outubro';
        break;
      case 11:
        formattedMonth = 'Novembro';
        break;
      case 12:
        formattedMonth = 'Dezembro';
        break;
    }
    return formattedMonth;
  }

  static List<Map<String, dynamic>> getStates() {
    final List<Map<String, dynamic>> listData = [
      {'uf': 'Minha localização atual', 'state': 'Minha localização atual'},
      {'uf': 'SP', 'state': 'São Paulo'},
      {'uf': 'MG', 'state': 'Minas Gerais'},
      {'uf': 'RJ', 'state': 'Rio de Janeiro'},
      {'uf': 'BA', 'state': 'Bahia'},
      {'uf': 'RS', 'state': 'Rio Grande do Sul'},
      {'uf': 'PR', 'state': 'Paraná'},
      {'uf': 'PE', 'state': 'Pernambuco'},
      {'uf': 'CE', 'state': 'Ceará'},
      {'uf': 'PA', 'state': 'Pará'},
      {'uf': 'MA', 'state': 'Maranhão'},
      {'uf': 'SC', 'state': 'Santa Catarina'},
      {'uf': 'GO', 'state': 'Goiás'},
      {'uf': 'PB', 'state': 'Paraíba'},
      {'uf': 'ES', 'state': 'Espírito Santo'},
      {'uf': 'AM', 'state': 'Amazonas'},
      {'uf': 'AL', 'state': 'Alagoas'},
      {'uf': 'PI', 'state': 'Piauí'},
      {'uf': 'RN', 'state': 'Rio Grande do Norte'},
      {'uf': 'MT', 'state': 'Mato Grosso'},
      {'uf': 'DF', 'state': 'Distrito Federal'},
      {'uf': 'MS', 'state': 'Mato Grosso do Sul'},
      {'uf': 'SE', 'state': 'Sergipe'},
      {'uf': 'RO', 'state': 'Rondônia'},
      {'uf': 'TO', 'state': 'Tocantins'},
      {'uf': 'AC', 'state': 'Acre'},
      {'uf': 'AP', 'state': 'Amapá'},
      {'uf': 'RR', 'state': 'Roraima'},
    ];
    return listData;
  }

  static getUfByStateName(String state) {
    String uf;
    switch (state) {
      case 'São Paulo':
        uf = 'SP';
        break;
      case 'Minas Gerais':
        uf = 'MG';
        break;
      case 'Rio de Janeiro':
        uf = 'RJ';
        break;
      case 'Bahia':
        uf = 'BA';
        break;
      case 'Rio Grande do Sul':
        uf = 'RS';
        break;
      case 'Paraná':
        uf = 'PR';
        break;
      case 'Pernambuco':
        uf = 'PE';
        break;
      case 'Ceará':
        uf = 'CE';
        break;
      case 'Pará':
        uf = 'PA';
        break;
      case 'Maranhão':
        uf = 'MA';
        break;
      case 'Santa Catarina':
        uf = 'SC';
        break;
      case 'Goiás':
        uf = 'GO';
        break;
      case 'Paraíba':
        uf = 'PB';
        break;
      case 'Espírito Santo':
        uf = 'ES';
        break;
      case 'Amazonas':
        uf = 'AM';
        break;
      case 'Alagoas':
        uf = 'AL';
        break;
      case 'Piauí':
        uf = 'PI';
        break;
      case 'Rio Grande do Norte':
        uf = 'RN';
        break;
      case 'Mato Grosso':
        uf = 'MT';
        break;
      case 'Distrito Federal':
        uf = 'DF';
        break;
      case 'Mato Grosso do Sul':
        uf = 'MS';
        break;
      case 'Sergipe':
        uf = 'SE';
        break;
      case 'Rondônia':
        uf = 'RO';
        break;
      case 'Tocantins':
        uf = 'TO';
        break;
      case 'Acre':
        uf = 'AC';
        break;
      case 'Amapá':
        uf = 'AP';
        break;
      case 'Roraima':
        uf = 'RR';
        break;
    }
    return uf;
  }

  static Future<bool> checkConnectivity() async {
    bool connected;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connected = true;
      }
    } on SocketException catch (_) {
      connected = false;
    }
    return connected;
  }
}
