import 'package:flutter/cupertino.dart';

class Book {
  String category;
  String title;
  String description;
  String imageUrl;
  int year;

  Book(
      {required this.category,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.year});
}

List<Book> DUMMY_BOOKS = [
  Book(
      category: "FAVORITES",
      title: 'Emma - Jane Austen',
      description:
          'I wonder what will become of her!’ So speculate the friends and neighbours of Emma Woodhouse, the lovely, lively, wilful,and fallible heroine of Jane Austen‘s fourth published novel. Confident that she knows best, Emma schemes to find a suitable husband for her pliant friend Harriet, only to discover that she understands the feelings of others as little as she does her own heart. As Emma puzzles and blunders her way through the mysteries of her social world, Austen evokes for her readers a cast of unforgettable characters and a detailed portrait of a small town undergoing historical transition. Written with matchless wit and irony, judged by many to be her finest novel, Emma has been adapted many times for film and television. This new edition shows how Austen brilliantly turns the everyday into the exceptional',
      year: 2008,
      imageUrl: 'https://www.storytel.com/images/e/640x640/0001149185.jpg'),
  Book(
      category: "PHILOSOPHY",
      title: 'Mansfield Park - Jane Austen',
      description:
          '‘Me!’ cried Fannaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaay … ‘Indeed you must excuse me. I could not act any thing if you were to give me the world. No, indeed, I cannot act.’ At the age of ten, Fanny Price leaves the poverty of her Portsmouth home to be brought up among the family of her wealthy uncle, Sir Thomas Bertram, in the chilly grandeur of Mansfield Park. There she accepts her lowly status, and gradually falls in love with her cousin Edmund. When the dazzling and sophisticated Henry and Mary Crawford arrive, Fanny watches as her cousins become embroiled in rivalry and sexual jealousy. As the company starts to rehearse a play by way of entertainment, Fanny struggles to retain her independence in the face of the Crawfords’ dangerous attractions; and when Henry turns his attentions to her, the drama really begins… This new edition does full justice to Austen’s complex and subtle story, placing it in its Regency context and elucidating the theatrical background that pervades the novel',
      year: 2008,
      imageUrl:
          'http://prodimage.images-bn.com/pimages/9780674058101_p0_v1_s1200x630.jpg'),
  Book(
      category: "HISTORY",
      title: 'Jane Eyre - Charlotte Brontë ',
      description:
          'Gentle reader, may you never feel what I then felt!’ Throughout the hardships of her childhood - spent with a severe aunt and abusive cousin, and later at the austere Lowood charity school - Jane Eyre clings to a sense of self-worth, despite of her treatment from those close to her. At the age of eighteen, sick of her narrow existence, she seeks work as a governess. The monotony of Jane’s new life at Thornfield Hall is broken up by the arrival of her peculiar and changeful employer, Mr Rochester. Routine at the mansion is further disrupted by mysterious incidents that draw the pair closer together but which, once explained, threaten Jane’s happiness and integrity. A flagship of Victorian fiction, Jane Eyre draws the reader in by the vigour of Jane’s voice and the novel’s forceful depiction of childhood injustice, of the restraints placed upon women, and the complexities of both faith and passion. The emotional charge of Jane’s story is as strong today as it was more than 150 years ago, as she seeks dignity and freedom on her own terms. In this new edition, Juliette Atkinson explores the power of narrative voice and looks at the striking physicality of the novel, which is both shocking and romantic.',
      year: 2019,
      imageUrl:
          'https://img.kitapyurdu.com/v1/getImage/fn:1011535/wh:true/miw:200/mih:200'),
  Book(
      category: "New Category",
      title: 'Crime and Punishment - Fyodor Dostoevsky',
      description:
          'One death, in exchange for thousands of lives - its simple arithmetic! A new translation of Dostoevskys epic masterpiece, Crime and Punishment (1866). The impoverished student Raskolnikov decides to free himself from debt by killing an old moneylender, an act he sees as elevating himself above conventional morality. Like Napoleon he will assert his will and his crime will be justified by its elimination of ‘vermin’ for the sake of the greater good. But Raskolnikov is torn apart by fear, guilt, and a growing conscience under the influence of his love for Sonya. Meanwhile the police detective Porfiry is on his trail. It is a powerfully psychological novel, in which the St Petersburg setting, Dostoevskys own circumstances, and contemporary social problems all play their par',
      year: 1866,
      imageUrl:
          'https://images.booksense.com/images/086/681/9798749681086.jpg'),
  Book(
      category: "FAVORITES",
      title: 'Anna Karenina - Leo Tolstoy ',
      description:
          'Love… it means too much to me, far more than you can understand.’ At its simplest, Anna Karenina is a love story. It is a portrait of a beautiful and intelligent woman whose passionate love for a handsome officer sweeps aside all other ties - to her marriage and to the network of relationships and moral values that bind the society around her. The love affair of Anna and Vronsky is played out alongside the developing romance of Kitty and Levin, and in the character of Levin, closely based on Tolstoy himself, the search for happiness takes on a deeper philosophical significance. One of the greatest novels ever written, Anna Karenina combines penetrating psychological insight with an encyclopedic depiction of Russian life in the 1870s. The novel takes us from high society St Petersburg to the threshing fields on Levins estate, with unforgettable scenes at a Moscow ballroom, the skating rink, a race course, a railway station. It creates an intricate labyrinth of connections that is profoundly satisfying, and deeply moving. Rosamund Bartletts translation conveys Tolstoys precision of meaning and emotional accuracy in an English version that is highly readable and stylistically faithful. Like her acclaimed biography of Tolstoy, it is vivid, nuanced, and compelling',
      year: 1870,
      imageUrl: 'https://www.storytel.com/images/e/640x640/0000904656.jpg'),
  Book(
      category: "FAVORITES",
      title: 'Great Expectations - Charles Dickens ',
      description:
          'You are to understand, Mr. Pip, that the name of the person who is your liberal benefactor remains a profound secret.’ Young Pip lives with his sister and her husband the blacksmith, with few prospects for advancement until a mysterious benefaction takes him from the Kent marshes to London. Pip is haunted by figures from his past - the escaped convict Magwitch, the time-withered Miss Havisham and her proud and beautiful ward, Estella - and in time uncovers not just the origins of his great expectations but the mystery of his own heart. A powerful and moving novel, Great Expectations is suffused with Dickenss memories of the past and its grip on the present, and it raises disturbing questions about the extent to which individuals affect each others lives. This edition includes a lively introduction, Dickenss working notes, the novels original ending, and an extract from an early theatrical adaptation. It reprints the definitive Clarendon text',
      year: 1759,
      imageUrl:
          'http://kbimages1-a.akamaihd.net/Images/b300a5df-adb1-4d43-b48f-53e35f2804d4/255/400/False/image.jpg'),
  Book(
      category: "FAVORITES",
      title: 'The Belly of Paris - Émile Zola ',
      description:
          'Respectable people… What bastards!’ Unjustly deported to Devils Island following Louis-Napoleons coup-détat in December 1851, Florent Quenu escapes and returns to Paris. He finds the city changed beyond recognition. The old Marché des Innocents has been knocked down as part of Haussmanns grand programme of urban reconstruction to make way for Les Halles, the spectacular new food markets. Disgusted by a bourgeois society whose devotion to food is inseparable from its devotion to the Government, Florent attempts an insurrection. Les Halles, apocalyptic and destructive, play an active role in Zolas picture of a world in which food and the injustice of society are inextricably linked. The Belly of Paris (Le Ventre de Paris) is the third volume in Zolas famous cycle of twenty novels, Les Rougon-Macquart. It introduces the painter Claude Lantier and in its satirical representation of the bourgeoisie and capitalism complements Zolas other great novels of social conflict and urban poverty',
      year: 1851,
      imageUrl:
          'https://m.media-amazon.com/images/I/510NUiDjuIL._AC_SY780_.jpg'),
  Book(
      category: "FAVORITES",
      title: 'The Bright Side of Life - Émile Zola ',
      description:
          'Neither spoke another word, they were gripped by a shared, unthinking madness as they plunged headlong together into vertiginous rapture. Orphaned with a substantial inheritance at the age of ten, Pauline Quenu is taken from Paris to live with her relatives, Monsieur and Madame Chanteau and their son Lazare, in the village of Bonneville on the wild Normandy coast. Her presence enlivens the household and Pauline is the only one who can ease Chanteaus gout-ridden agony. Her love of life contrasts with the insularity and pessimism that infects the family, especially Lazare, for whom she develops a devoted passion. Gradually Madame Chanteau starts to take advantage of Paulines generous nature, and jealousy and resentment threaten to blight all their lives. The arrival of a pretty family friend, Louise, brings tensions to a head. The twelfth novel in the Rougon Macquart series, The Bright Side of Life is remarkable for its depiction of intense emotions and physical and mental suffering. The precarious location of Bonneville and the changing moods of the sea mirror the turbulent relations of the characters, and as the story unfolds its title comes to seem ever more ironic',
      year: 2008,
      imageUrl:
          'https://m.media-amazon.com/images/I/41uAnsi3B4L._AC_SY780_.jpg'),
  Book(
      category: "FAVORITES",
      title: 'Emma ',
      description:
          'I wonder what will become of her!’ So speculate the friends and neighbours of Emma Woodhouse, the lovely, lively, wilful,and fallible heroine of Jane Austen‘s fourth published novel. Confident that she knows best, Emma schemes to find a suitable husband for her pliant friend Harriet, only to discover that she understands the feelings of others as little as she does her own heart. As Emma puzzles and blunders her way through the mysteries of her social world, Austen evokes for her readers a cast of unforgettable characters and a detailed portrait of a small town undergoing historical transition. Written with matchless wit and irony, judged by many to be her finest novel, Emma has been adapted many times for film and television. This new edition shows how Austen brilliantly turns the everyday into the exceptional',
      year: 2008,
      imageUrl: 'https://www.storytel.com/images/e/640x640/0001149185.jpg'),
];
