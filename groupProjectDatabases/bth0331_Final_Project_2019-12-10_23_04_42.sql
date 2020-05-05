-- MySQL dump 10.17  Distrib 10.3.17-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: bth0331_Final_Project
-- ------------------------------------------------------
-- Server version	10.3.17-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Access`
--

DROP TABLE IF EXISTS `Access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Access` (
  `userId` int(11) NOT NULL,
  `recipeId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`recipeId`),
  KEY `recipeId` (`recipeId`),
  CONSTRAINT `Access_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `User` (`id`),
  CONSTRAINT `Access_ibfk_2` FOREIGN KEY (`RecipeId`) REFERENCES `Recipe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Access`
--

LOCK TABLES `Access` WRITE;
/*!40000 ALTER TABLE `Access` DISABLE KEYS */;
INSERT INTO `Access` VALUES (1,1),(1,3),(2,2),(4,15),(4,16),(4,17),(4,18),(4,19),(4,20),(4,21),(4,22),(4,23),(4,24);
/*!40000 ALTER TABLE `Access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comprise`
--

DROP TABLE IF EXISTS `Comprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comprise` (
  `recipeId` int(11) NOT NULL,
  `ingredientId` int(11) NOT NULL,
  PRIMARY KEY (`recipeId`,`ingredientId`),
  KEY `ingredientId` (`ingredientId`),
  CONSTRAINT `Comprise_ibfk_1` FOREIGN KEY (`recipeId`) REFERENCES `Recipe` (`id`),
  CONSTRAINT `Comprise_ibfk_2` FOREIGN KEY (`ingredientId`) REFERENCES `Ingredient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comprise`
--

LOCK TABLES `Comprise` WRITE;
/*!40000 ALTER TABLE `Comprise` DISABLE KEYS */;
INSERT INTO `Comprise` VALUES (1,1),(1,2),(1,3),(1,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(3,12),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,19),(3,20),(15,14),(15,53),(15,54),(15,55),(15,56),(16,57),(16,58),(17,6),(17,7),(17,10),(17,59),(17,60),(17,61),(17,62),(17,63),(17,64),(18,5),(18,65),(18,66),(18,67),(18,68),(18,69),(19,5),(19,65),(19,66),(19,67),(19,70),(19,71),(19,72),(19,73),(20,74),(20,75),(21,5),(21,14),(21,53),(21,56),(21,67),(21,71),(21,76),(21,77),(21,78),(21,79),(21,80),(22,13),(22,14),(22,53),(22,55),(22,57),(22,80),(22,81),(22,82),(22,83),(22,84),(23,13),(23,55),(23,57),(23,77),(23,81),(23,83),(23,84),(23,85),(23,86),(23,87),(23,88),(23,89),(23,90),(24,55),(24,57),(24,77),(24,81),(24,83),(24,85),(24,87),(24,88),(24,89),(24,91),(24,92),(24,93),(24,94);
/*!40000 ALTER TABLE `Comprise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FoodType`
--

DROP TABLE IF EXISTS `FoodType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FoodType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('Appetizer','Beverage','Soups','Salads','Vegetables','Main Dishes','Breads','Desserts','Miscellaneous') NOT NULL,
  `dietaryInfo` enum('Vegetarian','Vegan','Glueten-Free','Sugar-Free','None') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FoodType`
--

LOCK TABLES `FoodType` WRITE;
/*!40000 ALTER TABLE `FoodType` DISABLE KEYS */;
INSERT INTO `FoodType` VALUES (1,'Appetizer',NULL),(2,'Soups',NULL),(3,'Main Dishes',NULL),(27,'Beverage',NULL),(31,'Salads',NULL),(32,'Vegetables',NULL),(34,'Breads',NULL),(35,'Desserts',NULL),(36,'Miscellaneous',NULL);
/*!40000 ALTER TABLE `FoodType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ingredient`
--

DROP TABLE IF EXISTS `Ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `foodGroup` enum('Fruit','Vegetable','Grain','Protein','Starch','Dairy') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingredient`
--

LOCK TABLES `Ingredient` WRITE;
/*!40000 ALTER TABLE `Ingredient` DISABLE KEYS */;
INSERT INTO `Ingredient` VALUES (1,'potato','Starch'),(2,'egg','Protein'),(3,'cheese','Dairy'),(4,'bacon','Protein'),(5,'olive oil','Vegetable'),(6,'carrots','Vegetable'),(7,'celery','Vegetable'),(8,'garlic cloves','Vegetable'),(9,'chicken broth','Protein'),(10,'noodles','Grain'),(11,'chicken','Protein'),(12,'1/2 pound elbow macaroni','Grain'),(13,'Butter','Dairy'),(14,'Eggs','Protein'),(15,'Evaporated milk','Dairy'),(16,'hot sauce','Dairy'),(17,'salt','Grain'),(18,'pepper','Grain'),(19,'dry mustard','Grain'),(20,'Sharp Cheddar (shredded)','Dairy'),(53,'eggs','Dairy'),(54,'bread crumbs','Grain'),(55,'flour','Grain'),(56,'mozzarella cheese','Dairy'),(57,'sugar','Starch'),(58,'lemon','Fruit'),(59,'beef','Protein'),(60,'onion','Vegetable'),(61,'celery','Vegetable'),(62,'parsley','Vegetable'),(63,'carrots','Vegetable'),(64,'noodles','Grain'),(65,'garlic','Vegetable'),(66,'parmesian cheese','Dairy'),(67,'olive oil','Vegetable'),(68,'bread','Grain'),(69,'romain lettuce','Vegetable'),(70,'garlic','Vegetable'),(71,'olive oil','Vegetable'),(72,'cauliflower','Vegetable'),(73,'parmesian cheese','Dairy'),(74,'salmon','Protein'),(75,'maple syrup','Starch'),(76,'tapioca flour','Grain'),(77,'milk','Dairy'),(78,'olive oil','Vegetable'),(79,'mozzarella cheese','Dairy'),(80,'eggs','Dairy'),(81,'sugar','Starch'),(82,'eggs','Dairy'),(83,'flour','Grain'),(84,'butter','Dairy'),(85,'sugar','Starch'),(86,'butter','Dairy'),(87,'milk','Dairy'),(88,'baking powder','Grain'),(89,'flour','Grain'),(90,'cinnamon','Grain'),(91,'flour','Grain'),(92,'baking powder','Grain'),(93,'sugar','Starch'),(94,'milk','Dairy');
/*!40000 ALTER TABLE `Ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Origin`
--

DROP TABLE IF EXISTS `Origin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Origin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` enum('Asia','Africa','North America','South America','Antarctica','Europe','Australia') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Origin`
--

LOCK TABLES `Origin` WRITE;
/*!40000 ALTER TABLE `Origin` DISABLE KEYS */;
INSERT INTO `Origin` VALUES (12,'Asia'),(5,'Africa'),(1,'North America'),(31,'South America'),(18,'Antarctica'),(23,'Europe'),(17,'Australia');
/*!40000 ALTER TABLE `Origin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recipe`
--

DROP TABLE IF EXISTS `Recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `originId` int(11) NOT NULL,
  `foodTypeId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `cookTime` int(11) NOT NULL,
  `servingSize` int(11) NOT NULL,
  `description` text NOT NULL,
  `instructions` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `originId` (`originId`),
  KEY `foodTypeId` (`foodTypeId`),
  KEY `userId` (`userId`),
  CONSTRAINT `Recipe_ibfk_1` FOREIGN KEY (`originId`) REFERENCES `Origin` (`id`),
  CONSTRAINT `Recipe_ibfk_2` FOREIGN KEY (`foodTypeId`) REFERENCES `FoodType` (`id`),
  CONSTRAINT `Recipe_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recipe`
--

LOCK TABLES `Recipe` WRITE;
/*!40000 ALTER TABLE `Recipe` DISABLE KEYS */;
INSERT INTO `Recipe` VALUES (1,1,1,1,'Twice-Baked Potato Bites',35,5,'a delicious twice-baked potato bite','Preheat oven to 375 degrees. Spray 2 mini muffin pans (or use 1 pan twice) with cooking spray.\nStir together the mashed potatoes, egg 3/4 cup cheddar cheese, and 2 tablespoons chopped bacon. Using a spoon, scoop potato mixture into cups, packing the potatoes down into each cup. Bake for 30-35 minutes or until golden brown and crisp around the edges.\nRemove pan from the oven, top the potato mixture with the remaining 1/4 cup cheddar cheese and return to the oven for 3 more minutes.\nRemove pan from the oven and transfer to a rack. Let potatoes cool for 5 minutes.\nUsing a knife or mini metal spatula, transfer the potato cups to a serving dish and the remaining tablespoon of chopped bacon. Serve immediately.'),(2,1,2,2,'Chicken Noodle Soup',30,6,'the soup that grandma made',' a large Dutch oven or stockpot, add the oil and heat over medium-high heat to warm.\nAdd the carrots, celery, onion, and sauté for about 7 minutes, or until vegetables begin to soften. Stir intermittently.\nAdd the garlic and sauté for another 1 to 2 minutes.\nAdd the chicken broth, bay leaves, thyme, oregano, pepper, and bring to a boil. Allow mixture to boil gently for about 5 minutes or until vegetables are fork-tender. Note – If you like brothier soup, add additional broth, possibly as much as an additional 64 ounces because as time passes the noodles will continue to absorb broth.\nAdd the egg noodles and boil mixture for about 10 minutes, or until noodles are soft and cooked through. At any time while making the soup, if the overall liquid level is lower than you like and you prefer more broth, adding a cup or two of water is okay. At the end you will adjust the salt level.\nAdd the chicken, parsley, optional lemon juice (brightens up the flavor), and boil 1 to 2 minutes, or until chicken is warmed through. Taste soup and add salt to taste. I added about 1 tablespoon but this will vary based on how salty the brand of chicken broth used is, how salty the rotisserie chicken is, and personal preference. Make any necessary seasoning adjustments (i.e. more salt, pepper, herbs, etc.), remove the bay leaves, and serve immediately. Soup will keep airtight in the fridge for 5 to 7 days or in the freezer for up to 6 months.'),(3,1,3,1,'Stove Top Mac-n-Cheese',35,7,'Not chef Ramsay\'s mac and cheese but better than kraft','1) In the large pot of boiling, salted water cook the past to al dente and drain.  Return to the pot and melt in the butter. Toss to coat.  2) Whisk together the eggs, milk, hot sauce, salt, pepper, and mustard.  Stir into the pasta and add the cheese.  Over low heat contiue to stir for 3 minutes or until creamy.  '),(15,1,1,4,'Mozzarella Sticks',20,8,'delicious mozzarella sticks','In a small bowl, mix the eggs and water. Mix the bread crumbs and garlic salt in a medium bowl. In a medium bowl, blend the flour and cornstarch. In a large heavy saucepan, heat the oil to 365 degrees F (185 degrees C). One at a time, coat each mozzarella stick in the flour mixture, then the egg mixture, then in the bread crumbs and finally into the oil. Fry until golden brown, about 30 seconds. Remove from heat and drain on paper towels.'),(16,23,27,4,'Best Lemonade Ever',5,5,'The best lemonade ever','In a small saucepan, combine sugar and 1 cup water. Bring to boil and stir to dissolve sugar. Allow to cool to room temperature, then cover and refrigerate until chilled. Remove seeds from lemon juice, but leave pulp. In pitcher, stir together chilled syrup, lemon juice and remaining 7 cups water.'),(17,18,2,4,'Beef Noodle Soup',50,6,'delicous beef noodle soup','In a large saucepan over medium high heat, saute the stew meat, onion and celery for 5 minutes, or until meat is browned on all sides. Stir in the bouillon, parsley, ground black pepper, carrots, water and egg noodles. Bring to a boil, reduce heat to low and simmer for 30 minutes.'),(18,17,31,4,'Everyday Salad',20,2,'a very boring everyday salad','Mince 3 cloves of garlic, and combine in a small bowl with mayonnaise, anchovies, 2 tablespoons of the Parmesan cheese, Worcestershire sauce, mustard, and lemon juice. Season to taste with salt and black pepper. Refrigerate until ready to use.Heat oil in a large skillet over medium heat. Cut the remaining 3 cloves of garlic into quarters, and add to hot oil. Cook and stir until brown, and then remove garlic from pan. Add bread cubes to the hot oil. Cook, turning frequently, until lightly browned. Remove bread cubes from oil, and season with salt and pepper. Place lettuce in a large bowl. Toss with dressing, remaining Parmesan cheese, and seasoned bread cubes.'),(19,31,32,4,'Roasted Garlic Cauliflower',40,6,'makes cauliflower actually taste good','Preheat the oven to 450 degrees F (220 degrees C). Grease a large casserole dish. Place the olive oil and garlic in a large resealable bag. Add cauliflower, and shake to mix. Pour into the prepared casserole dish, and season with salt and pepper to taste. Bake for 25 minutes, stirring halfway through. Top with Parmesan cheese and parsley, and broil for 3 to 5 minutes, until golden brown.'),(20,12,3,4,'Cardamom Maple Salmon',25,10,'salmon that taste sweet because fish isn\'t weird enough','Stir salt, paprika, cardamom, coriander, and black pepper together in a bowl. Add oil and maple syrup and stir until evenly combined. Preheat a non-stick frying pan over medium-high heat, about 350 degrees F (175 degrees C). Dredge salmon pieces through the maple syrup mixture until evenly coated on all sides. Cook salmon in the preheated pan until fish flakes easily with a fork, 5 to 7 minutes per side.'),(21,31,34,4,'Brazilian Cheese Bread',45,6,'it\'s bread with cheese in it','Preheat the oven to 400 degrees F (200 degrees C). Place tapioca flour in a mixing bowl. Combine milk, olive oil, and salt in a pan. Bring to a simmer over medium-high heat. Immediately remove from heat and pour into the bowl with the tapioca. Mix until a shaggy dough starts to form. Let rest for 5 minutes. Add mozzarella and Parmesan cheeses, eggs, and cayenne. Stir with a fork until thoroughly combined. Use an ice cream scoop to portion dough onto a silicone-lined baking sheet. Poke down any jagged bits using a wet finger if desired. Bake in the preheated oven until puffed and golden, about 20 minutes. Let cool for 5 minutes and serve warm.'),(22,5,35,4,'Best Brownies',60,4,'insert cannabis joke here','Preheat oven to 350 degrees F (175 degrees C). Grease and flour an 8-inch square pan. In a large saucepan, melt 1/2 cup butter. Remove from heat, and stir in sugar, eggs, and 1 teaspoon vanilla. Beat in 1/3 cup cocoa, 1/2 cup flour, salt, and baking powder. Spread batter into prepared pan. Bake in preheated oven for 25 to 30 minutes. Do not overcook. To Make Frosting: Combine 3 tablespoons softened butter, 3 tablespoons cocoa, honey, 1 teaspoon vanilla extract, and 1 cup confectioners\' sugar. Stir until smooth. Frost brownies while they are still warm.'),(23,5,36,4,'Donut Muffins',40,8,'they are delicous','Preheat oven to 375 degrees F (190 degrees C). Grease 24 mini-muffin cups. Mix 1/2 cup sugar, 1/4 cup margarine, and nutmeg in a large bowl. Stir in the milk, then mix in the baking powder and flour until just combined. Fill the prepared mini muffin cups about half full. Bake in the preheated oven until the tops are lightly golden, 15 to 20 minutes. While muffins are baking, place 1/4 cup of melted margarine in a bowl. In a separate bowl, mix together 1/2 cup of sugar with the cinnamon. Remove muffins from their cups, dip each muffin in the melted margarine, and roll in the sugar-cinnamon mixture. Let cool and serve.'),(24,1,34,4,'Biscuts',45,7,'the best biscuts','Preheat oven to 425 degrees F (220 degrees C). In a large bowl, whisk together the flour, baking powder, salt, and sugar. Cut in the shortening until the mixture resembles coarse meal. Gradually stir in milk until dough pulls away from the side of the bowl. Turn out onto a floured surface, and knead 15 to 20 times. Pat or roll dough out to 1 inch thick. Cut biscuits with a large cutter or juice glass dipped in flour. Repeat until all dough is used. Brush off the excess flour, and place biscuits onto an ungreased baking sheet. Bake for 13 to 15 minutes in the preheated oven, or until edges begin to brown.');
/*!40000 ALTER TABLE `Recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fName` varchar(64) NOT NULL,
  `lName` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'John','Doe','john.doe@gmail.com'),(2,'Jane','Doe','jane.doe@gmail.com'),(3,'Braxden','Hanzelka','bth0331@westminstercollege.edu'),(4,'katherine','sublette','katherine.sublette@gmail.com'),(5,'tim','sublette','tim.sublette@gmail.com');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-11  6:04:42
