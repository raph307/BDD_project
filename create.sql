CREATE TABLE restaurants
(
    restaurant_id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    coordonnees_gps VARCHAR(255) NOT NULL,
)

CREATE TABLE items
(
    item_id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prix DECIMAL(10, 2) NOT NULL,
    restaurant_id INT REFERENCES restaurants(restaurant_id)
)

CREATE TABLE proprietes_items
(
    propriete_items_id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
)

CREATE TABLE ingredients
(
    ingredient_id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    kcal_pour_100g INT NOT NULL,
    proteines_pour_100g DECIMAL(10, 2) NOT NULL
)

CREATE TABLE avoir_proprietes_items
(
    item_id INT REFERENCES items(item_id),
    propriete_items_id INT REFERENCES proprietes_items(propriete_items_id),
    PRIMARY KEY (item_id, propriete_items_id)
)

CREATE TABLE composer
(
    item_id INT REFERENCES items(item_id),
    ingredient_id INT REFERENCES ingredients(ingredient_id),
    quantite_g INT NOT NULL,
    PRIMARY KEY (item_id, ingredient_id)
)

CREATE TABLE etre_accompagne_de
(
    item_id1 INT REFERENCES items(item_id),
    item_id2 INT REFERENCES items(item_id),
    PRIMARY KEY (item_id1, item_id2)
)

CREATE TABLE categories_items
(
    categorie_item_id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
)

