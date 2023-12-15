import 'package:coletapp/layers/views/widgets/drawer.dart';
import 'package:flutter/material.dart';

class TermosView extends StatelessWidget {
  const TermosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Termos e condições'), actions: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            width: 150,
            child: Image.asset(
              'assets/images/coletapp menu.png',
              fit: BoxFit.contain,
            ),
          )
        ]),
        drawer: MainDrawer(),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: const Expanded(
                child: Text(
              'POLÍTICA DE PRIVACIDADE DO COLETAPP\n \nÚltima atualização: 06/12/2022\n \nSeja sempre bem-vindo prezado associado e usuário interessado em nos conhecer melhor. Este aviso de privacidade foi elaborado para que você possa fazer o melhor uso do aplicativo e também com o objetivo de lhe apresentar nosso compromisso com a segurança, boa-fé, transparência e confidencialidade no tratamento de dados pessoais de todas as pessoas que nos visitam por meio desta plataforma, tornando claras as medidas que adotamos para atender à legislação vigente e ao seu interesse.\n \nOs nossos Axis diversos serviços estão em processo contínuo de adequação à LGPD – Lei Geral de Proteção de Dados Pessoais e por esse motivo, alguns termos de uso e novos procedimentos poderão ser adotados e atualizados, sempre que um novo produto ou serviço seja oferecido aos usuários/associados ou às novas legislações assim determinarem.\n \nDesde o dia 18 de setembro de 2020, temos uma nova lei brasileira (Lei 13.709/18 – LGPD) em vigor, a qual determina o cumprimento de algumas normas e procedimentos para a coleta e tratamento dos dados pessoais, motivo pelo qual o consentimento/aceite expresso do Aviso de Privacidade para os titulares passou a ser necessário, podendo o mesmo ser registrado nos sites, no painel dedicado aos usuários ou demais meios de comunicação adotados;\n \nO presente Aviso tem como propósito:\n \nGarantir que o usuário entenda quais dados pessoais seus são coletados, as razões pelas quais os coletamos e tratamos, além de saber com quem os compartilhamos e o motivo;\n \nExplicar como utilizamos os dados pessoais compartilhados por você na Plataforma, para lhe proporcionar uma experiência segura, transparente e em conformidade com a legislação vigente ao acessar o nosso site;\n \nInformar sobre os seus direitos em relação aos dados pessoais que nos fornece e são tratados por nós e também de que forma protegemos a sua privacidade.\n \n1. Direitos e preferências do Usuário\n \nA COLETAPP se encontra em processo de adequação à Lei Geral de Proteção de Dados (“Lei nº 13.709/18”, denominada “LGPD”), a qual confere determinados direitos aos titulares relativos aos seus dados pessoais.\n \nSe lhe enviarmos mensagens de publicidade eletrônica com base no seu consentimento ou de outra forma permitida pela lei aplicável, você poderá, quando entender necessário, revogar a sua autorização. As mensagens de publicidade eletrônica que você recebe da COLETAPP por e-mail, possibilitam que solicite o cancelamento de envios\n \n2. Manter os dados pessoais do Usuário em segurança\n \nContinuamente nos mantemos empenhados em proteger os dados pessoais dos nossos Usuários, adotando medidas técnicas e organizacionais para ajudar a proteger a segurança dos seus dados pessoais. Porém é importante lembrar que nenhum sistema é completamente seguro. As medidas de segurança implementadas consideram, como prevê a Lei, a natureza dos dados e de tratamento, os riscos envolvidos, a tecnologia existente e sua disponibilidade.\n \n3. Crianças e Adolescentes\n \nA Plataforma não se destina a crianças e adolescentes, isto é, indivíduos com idade inferior a 18 anos.\n \nNão coletamos deliberadamente dados pessoais de crianças e adolescentes. Se o usuário tiver idade inferior a 18 anos, não deverá utilizar a Plataforma e nem nos fornecer quaisquer dados pessoais.\n \nSe tomarmos conhecimento de que coletamos dados pessoais de uma criança ou adolescente, tomaremos as medidas razoáveis para eliminar os dados pessoais em questão.\n \n4. Alterações ao presente Aviso de Privacidade\n \nEventualmente, poderemos efetuar alterações ao presente Aviso.\n \nQuando realizarmos alterações materiais ao presente Aviso, faremos uma comunicação clara, visível e adequada de acordo com as circunstâncias, como por exemplo, apresentando uma comunicação visível na Plataforma ou por meio do envio de um e-mail ao Usuário. Poderemos enviar antecipadamente uma comunicação a você.\n \nAssim, é fundamental que você se certifique de ler qualquer comunicação atentamente e periodicamente consulte este Aviso.\n \n5. Fale com a COLETAPP\n \nObrigado por ler o nosso Aviso de Privacidade. A COLETAPP, é responsável pelo tratamento de dados para fins dos dados pessoais do usuário processados nos termos deste Aviso.\n \nSe tiver dúvidas quanto ao seu conteúdo, pedimos que entre em contato com o nosso Encarregado de Dados Pessoais (“Data Protection Officer”), para efeito da Lei brasileira nº 13.709/2018 (LGPD – Lei Geral de Proteção de Dados), com início de vigência em 18 de setembro de 2020, pelo e-mail: coletapp@gmail.com',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                decoration: TextDecoration.none,
                wordSpacing: 2,
              ),
            )),
          ),
        )));
  }
}
