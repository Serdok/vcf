import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class Faq extends StatefulWidget {
  const Faq ({Key? key}) : super (key: key);

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQ"),
      ),
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.blue,
          useInkWell: true,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            Card1(),
            Card2(),
            Card3(),
            Card4(),
          ],
        ),
      ),
    );
  }
}

const article1 =
    "Lors d’un changement d’alimentation, chez nos animaux de compagnie, il est de bon ton d’entamer une transition alimentaire. ";
const pourquoi =
    "Leur organisme, à force de recevoir le même type de nourriture, s’y habitue. Il produit donc une flore intestinales idéale pour son alimentation. "
    "En cas de changement, il peut ressentir de l’inconfort : nausées, ballonnement, digestion difficile, gaz, diarrhées, constipation… Pour réduire les risques, et les inconforts, "
    "il suffit d’introduire petit à petit le nouvel aliment dans la ration habituelle de votre petit compagnon ! ";
const quand =
    "La transition alimentaire est alors à réaliser lors de changement d’alimentation chez le chien et le chat, changement de marque ou de gamme de croquette. Elle s’effectue sur une durée de 10 jours entre le passage des anciennes aux nouvelles croquettes. ";
const suite =
    "Lorsque le changement est pour une alimentation thérapeutique (diabétique ou rénal par exemple) de la même marque de croquette, ou entre gammes similaires, la transition alimentaire n’est pas nécessaire. ";
const plus =
    "L’eau est un apport essentiel à la vie et doit être laisser à volonté.Pour les chats qui n’ont pas une prise de boisson spontané, la fontaine à eau est une très bonne façon de stimuler l’hydratation. Il faut néanmoins garder en tête que ceux-ci ont naturellement moins tendance à boire que les chiens.Les aliments riches en eau peuvent aussi les aider comme le pâté, la courgette ou le concombre, à augmenter leur apport en eau. De plus, ils adorent ça.";

class Card1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Article 1 : La transition alimentaire",
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                    collapsed: const Text(
                      article1,
                      softWrap: true,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        for (var _ in Iterable.generate(1))
                          const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                article1,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              )),
                              const Text(
                                "Pourquoi ?",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                              const Text(
                                pourquoi,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                              const Text(
                                "Quand réaliser la transition ?",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                              const Text(
                                quand,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                              const Text(
                                suite,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                              const Text(
                                "Le petit plus",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                              const Text(
                                plus,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

const article2 =
    "Vous allez en supermarché ou en jardinerie et hésitez entre trois paquets. Ils sont tous au poulet, mais les appellations ne sont pas très claires. L’un est « au goût de poulet », le deuxième, est juste « au poulet » et le troisième est « riche en poulet ».";
const difference =
    "En réalité ce lexique a bien un rapport avec la quantité de poulet présent dans l’aliment, c’est une marque de transparence de l’industrielle vis-à-vis du consommateur. \nUn paquet de croquette clamant être « Au goût de poulet », « aromatisé au poulet », « contient au poulet » contient jusqu’à 4% de poulet. \nUn paquet « Au poulet » contient au moins 4% de poulet et jusqu’à 14%. \n« Riche en poulet » signifie que l’aliment contient au moins 14% poulet. ";
const plus2 =
    "Attention, qu’un aliment soit « au gout de poulet » n’empêche pas la présence d’autres viandes dans la composition. De temps en temps, on peut avoir le même paquet de croquette, avec la même composition, dont l’étiquette clame un goût différent. En effet, s’il n’y a que 2% de poulet, ils peuvent être accompagnés de 2% de bœuf et de 2% d’agneau… Si votre animal préfère une viande en particulier, mais n’apprécie pas ses nouvelles croquettes, jetez un coup d’œil à la composition…Vous pourriez ne pas être déçu !";

class Card2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Article 2 : Les appellations des goûts des aliments",
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                    collapsed: const Text(
                      article2,
                      softWrap: true,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        for (var _ in Iterable.generate(1))
                          const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                article2,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              )),
                        const Text(
                          "Savez-vous faire la différence ? Y a-t-il réellement une différence ?  ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          difference,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          "Le petit plus",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          plus2,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

const question =
"Votre animal engloutit sa nourriture en un éclair et ne se régule pas ? ";
const regule =
    "Il est difficile de voir son animal se jeter sur sa nourriture et tout engloutir en quelques minutes. En plus d’avaler sa ration, il englouti de l’air, finit ballonné, plein de gaz, et bonjour les dégâts. Mais rassurez-vous, plusieurs solutions existent ! ";
const regule2 =
    "Il est possible de mettre en place une gamelle anti-glouton ! Il s’agit d’un dispositif conçu pour rendre l’accès aux croquettes plus difficile pour l’animal, ce qui le pousse à manger plus lentement. L’avantage, c’est aussi que ça l’occupe ! ";
const regule3 =
    "Une autre solution est de mettre une partie de sa ration dans un Kong. ";
const regule4 =
    "Le Kong est un jouet dans lequel vous pouvez mettre de la nourriture, ce qui permet aussi de stimuler l’animal et de l’occuper notamment en votre absence. Il existe aussi des plateaux de jeux dont le but est d’y mettre tout ou partie de la ration, afin que l’animal se nourrisse en jouant et que l’ingestion de son repas soit ralentie. ";
const regule5 =
    "Ces dispositifs sont disponibles chez votre vétérinaire, en animalerie et sur internet.";
const plus3 =
    "Certaines gamelles ou plateaux de jeux présentent des puzzles et des énigmes à plusieurs niveaux qui stimuleront votre chien. Et elles ne sont pas uniquement réservées aux gloutons, tous les chiens peuvent y jouer, et même les chats !";
const plus4 =
    "Si votre chien supporte mal la solitude, où s’il a tendance à faire des bêtises lors de vos absences, des petits jeux autour de la nourriture et de la distribution de sa ration pourront le tenir occupé pendant un temps plus ou moins réduit, et lui fournir une stimulation nécessaire pour chasser l’ennui !";

class Card3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Article 3 : Mon animal est un glouton !",
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                    collapsed: const Text(
                      question,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      softWrap: true,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        for (var _ in Iterable.generate(1))
                          const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                question,
                                style: TextStyle(fontWeight: FontWeight.bold),
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              )),
                        const Text(
                          regule,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          "\n",
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          regule2,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          "\n",
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          regule3,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          "\n",
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          regule4,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          "\n",
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          regule5,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          "\n",
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          "Le petit plus",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          plus3,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          plus4,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

const question1 =
    "Vos animaux ont des régimes alimentaires différents mais vous ne parvenez pas à séparer leur nourriture ? ";
const regime =
    "Certaines maladies (urinaire, rénale, dermatologique...) peuvent malheureusement imposer un régime alimentaire bien particulier. ";
const regime2 =
"Mais quand nous avons plusieurs animaux, ça devient un vrai casse-tête ! Comment faire en sorte que chacun mange les croquettes qui lui sont attribuées ?";
const regime3 =
    "Voici la solution : une gamelle à reconnaissance par puce électronique ! ";
const regime4 =
"Ces gamelles sont dotées d’un système de reconnaissance par identification électronique de l’animal, ce qui signifie que seul l’animal porteur de la puce enregistrée dans le dispositif pourra accéder au contenu de ce dernier. ";
const regime5 =
    "Si ce n’est pas lui, la gamelle ne s’ouvrira pas ! Ce qui permet de respecter les régimes de chacun. \nCela implique cependant que l’animal soit identifié par puce électronique, ce qui se fait uniquement par un vétérinaire, de façon rapide et indolore.";
const plus5 =
"Certaines de ces gamelles peuvent même être connectées à votre smartphone, pour suivre de près l’ingestion des aliments par vos animaux. Grâce à une balance connectée, elle vous permet de contrôler au gramme près le dosage des rations de vos petits compagnons, mais également d’enregistrer leurs habitudes alimentaires, notamment celles des chats. ";
const plus6 =
    "Elles fonctionnent avec de la nourriture sèche et de la nourriture humide séparément ou ensemble, et possèdent même en option des bols hermétiques, pour garder la fraîcheur des aliments le plus longtemps possible.\nPour les foyers où il y a plusieurs maîtres, cela permet de vérifier qui a eu sa portion, et à quel moment, et ainsi éviter les resquillages !";

class Card4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Article 4 :",
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                    collapsed: const Text(
                      question1,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      softWrap: true,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        for (var _ in Iterable.generate(1))
                          const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                question1,
                                style: TextStyle(fontWeight: FontWeight.bold),
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              )),
                        const Text(
                          regime,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          "\n",
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          regime2,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          "\n",
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          regime3,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          "\n",
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          regime4,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          "\n",
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          regime5,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          "\n",
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          "Le petit plus",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          plus5,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        const Text(
                          plus5,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}