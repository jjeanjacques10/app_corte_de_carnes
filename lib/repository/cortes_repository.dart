import 'package:app_corte_de_carnes/models/cortes_model.dart';
import 'database.dart';

class CorteRepository {
  Future<List<CorteModel>> findAllAsync() async {
    var db = Database();
    await db.createDatabase();

    List<CorteModel> cortes = new List<CorteModel>();

    if (db.created) {
      cortes = new List<CorteModel>();

      cortes.add(
        new CorteModel(
          id: 1,
          name: 'Acém',
          image: 'assets/images/1.jpg',
          descricao:
              'Econômica, macia e com pouca gordura, pode ser usada moída ou no preparo cozidos, carne de panela, ensopados, picadinhos, refogados, ou preparadas com molho.',
          preco: 200.00,
          qtd: 810,
        ),
      );

      cortes.add(
        new CorteModel(
          id: 2,
          name: 'Alcatra',
          image: 'assets/images/2.jpg',
          descricao:
              'É um corte macio e se divide em: ponta de alcatra, ideal para bifes; e a alcatra propriamente dita, boa para assados, grelhados e picadinhos. Também fica excelente no churrasco, tanto no espeto como em bifes grossos na grelha. Mas evite cortes finos, pois a carne pode ressecar.',
          preco: 400.00,
          qtd: 98,
        ),
      );

      cortes.add(
        new CorteModel(
          id: 3,
          name: 'Contrafilé',
          image: 'assets/images/3.jpeg',
          descricao:
              'Localiza-se na parte externa da coluna vertebral. Acamada de gordura na lateral deixa a carne saborosa e macia. É indicada para o preparo de bifes de chapa, estrogonofe, grelhados, medalhões e churrasco. Escolha uma peça com a manta de gordura uniforme para mantê-la tenra e suculenta.',
          preco: 900.00,
          qtd: 200,
        ),
      );

      cortes.add(
        new CorteModel(
          id: 4,
          name: 'Coxão duro',
          image: 'assets/images/4.png',
          descricao:
              'Corte grande, com fibras alongadas e consistência firme, envolvido por uma capa de gordura. Para ficar macia deve ser cozida lentamente, e por isso é indicado para ensopados, molhos e sopas. ',
          preco: 1000.00,
          qtd: 100,
        ),
      );

      cortes.add(
        new CorteModel(
          id: 5,
          name: 'Coxão mole',
          image: 'assets/images/5.png',
          descricao:
              'O músculo arredondado, com fibras curtas e consistência macia. Excelente para o preparo de assados, grelhados, escalopes, bifes finos, à milanesa e até moído.',
          preco: 900.00,
          qtd: 1230,
        ),
      );

      cortes.add(
        new CorteModel(
          id: 6,
          name: 'Costela',
          image: 'assets/images/6.png',
          descricao:
              'O corte, com ossos maiores e mais largos, tem sabor, textura e aroma marcantes. Seu cozimento leva tempo, pois é preciso amaciar as fibras. Mas a espera vale a pena! Utilizada principalmente em churrasco, é deliciosa.',
          preco: 1000.00,
          qtd: 100,
        ),
      );
    }
    cortes.sort((a, b) => a.name.compareTo(b.name));

    return new Future.value(cortes);
  }
}
