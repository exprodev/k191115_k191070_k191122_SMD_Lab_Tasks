import 'package:flutter/material.dart';
import 'package:cat_ui/profile_model.dart';
import 'package:cat_ui/item.dart';
import 'package:provider/provider.dart';

class MyListItems extends StatelessWidget {
  final ProfileModel profile;

  const MyListItems({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Item> featuredItems =
        _items.where((item) => item.featured).toList();
    final List<Item> regularItems = _items.toList();

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
          child: Text(
            'Featured',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: featuredItems.length,
          itemBuilder: (context, index) {
            final item = featuredItems[index];
            return buildItemCard(item, context);
          },
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
          child: Text(
            'All Cats',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: regularItems.length,
          itemBuilder: (context, index) {
            final item = regularItems[index];
            return buildItemCard(item, context);
          },
        ),
      ],
    );
  }

  Widget buildItemCard(Item item, BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 8, 20, 0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(item.imageLink),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Text(
                      item.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      item.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Center(
                      child: SizedBox(
                        width: 160,
                        child: profile.items.contains(item)
                            ? ElevatedButton(
                                onPressed: () {
                                  Provider.of<ProfileModel>(context,
                                          listen: false)
                                      .removeItem(item);
                                },
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 0, 0, 0)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 226, 225, 225)),
                                ),
                                child: Text('Remove'),
                              )
                            : ElevatedButton(
                                onPressed: () {
                                  Provider.of<ProfileModel>(context,
                                          listen: false)
                                      .addItem(item);
                                },
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 255, 255, 255)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 245, 112, 50)),
                                ),
                                child: Text('Add'),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<Item> _items = [
  Item(
    name: 'Persian Cat',
    description: 'The Persian cat is known for its long and luxurious coat.',
    featured: false,
    imageLink: 'assets/images/persian_cat.png',
  ),
  Item(
    name: 'Siamese Cat',
    description: 'The Siamese cat has striking blue almond-shaped eyes.',
    featured: true,
    imageLink: 'assets/images/siamese_cat.png',
  ),
  Item(
    name: 'Maine Coon',
    description:
        'The Maine Coon is one of the largest domesticated cat breeds.',
    featured: false,
    imageLink: 'assets/images/maine_coon.png',
  ),
  Item(
    name: 'Bengal Cat',
    description: 'The Bengal cat has a distinctive spotted or marbled coat.',
    featured: true,
    imageLink: 'assets/images/bengal_cat.png',
  ),
  Item(
    name: 'Sphynx Cat',
    description: 'The Sphynx cat is known for its lack of fur.',
    featured: false,
    imageLink: 'assets/images/sphynx_cat.png',
  )
];
