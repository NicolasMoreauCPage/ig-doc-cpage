# Structure des pages & menu

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
  index.md:
    title: Accueil
  guide-technique.md:
    title: Guide technique
menu:
  Accueil: index.html
  "Guide technique": guide-technique.html
```

## Bonnes pratiques
- Gardez la structure pages/menu synchronisée avec les fichiers présents dans `input/pages/`.
- Pour masquer une page du menu, ne l’ajoutez pas dans `menu:` (elle reste accessible par URL directe).
- Utilisez des titres clairs et concis.
- Pour des sous-menus, imbriquez les entrées YAML.

## Voir aussi
- "Prise en main rapide" pour un tutoriel pas à pas.
- [Doc officielle Sushi](https://fshschool.org/docs/sushi/configuration/)
