# Prise en main rapide

Cette page vous guide pour démarrer rapidement avec un IG FHIR documentaire CPage.

## 1. Créer une nouvelle page
- Ajoutez un fichier `.md` dans `input/pages/` (ex : `ma-nouvelle-page.md`).

## 2. Déclarer la page dans sushi-config.yaml
- Ajoutez dans la section `pages:` :
  ```yaml
  pages:
    ma-nouvelle-page.md:
      title: Ma nouvelle page
  ```

## 3. Ajouter la page au menu
- Ajoutez dans la section `menu:` :
  ```yaml
  menu:
    "Ma nouvelle page": ma-nouvelle-page.html
  ```

## 4. Générer le site IG
- Exécutez :
  ```sh
  ./_genonce.sh
  ```
- Retrouvez la page dans le menu du site généré.

## 5. Aller plus loin
- Consultez la page "Structure des pages & menu" pour des exemples avancés.
- Voir aussi la page "Installation" pour les prérequis techniques.
