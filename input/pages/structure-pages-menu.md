

# Structure des pages et menu

Cette page regroupe toutes les bonnes pratiques pour organiser vos pages et le menu de navigation dans un IG FHIR.


## Où placer les fichiers markdown ?
- Placez chaque page dans `input/pages/`.


## Déclarer les pages dans sushi-config.yaml
- Dans la section `pages:`, listez chaque fichier `.md` à générer.
- Le titre associé s'affichera en haut de la page.


## Déclarer le menu de navigation
- Dans la section `menu:`, structurez le menu comme vous le souhaitez.
- Les clés sont les libellés du menu, les valeurs les fichiers `.html` générés.
- Utilisez l'imbrication YAML pour les sous-menus.


## Exemples
```yaml
pages:

  # Structure des pages & menu

  ## Déclaration des pages dans sushi-config.yaml

  Dans `sushi-config.yaml`, la section `pages:` liste les pages Markdown à intégrer au site IG. L’ordre de déclaration définit l’ordre de navigation.

  **Exemple :**
  ```yaml
  pages:
    index.md:
      title: Accueil
    introduction.md:
      title: Introduction
    structure-ig.md:
      title: Structure IG
    quickstart.md:
      title: Prise en main rapide
    bonnes-pratiques.md:
      title: Bonnes pratiques
    publication-validation.md:
      title: Publication & validation
    faq.md:
      title: FAQ
    outils.md:
      title: Outils
    liens-utiles.md:
      title: Liens utiles
    annexes.md:
      title: Annexes
  ```

  ## Déclaration du menu

  La section `menu:` personnalise la navigation. On peut organiser les pages, créer des sous-menus, ou lier des ressources externes.

  **Exemple simple :**
  ```yaml
  menu:
    "Accueil": index.html
    "Introduction": introduction.html
    "Structure IG": structure-ig.html
    "Prise en main": quickstart.html
    "Bonnes pratiques": bonnes-pratiques.html
    "Publication & validation": publication-validation.html
    "FAQ": faq.html
    "Outils": outils.html
    "Liens utiles": liens-utiles.html
    "Annexes": annexes.html
  ```

  **Exemple avec sous-menus :**
  ```yaml
  menu:
    "Documentation":
      "Accueil": index.html
      "Introduction": introduction.html
      "Structure IG": structure-ig.html
      "Prise en main": quickstart.html
      "Bonnes pratiques": bonnes-pratiques.html
    "Publication":
      "Publication & validation": publication-validation.html
    "Ressources":
      "Outils": outils.html
      "Liens utiles": liens-utiles.html
      "Annexes": annexes.html
    "FAQ": faq.html
  ```

  ## Bonnes pratiques
  - Structurez le menu de façon simple et logique
  - Utilisez des titres courts et explicites
  - Groupez les pages par thématique si besoin
  - Vérifiez la cohérence entre `pages:` et `menu:`
  - Testez la navigation après chaque modification

  Pour des exemples avancés, voir la [documentation du template HL7 IG](https://github.com/HL7/ig-template-base#pages-and-menu).
