
# Déclarer des pages et le menu dans un IG FHIR


## 1. Où placer les fichiers markdown ?

- Placez chaque page de documentation dans le dossier `input/pages/`.
- Le nom du fichier doit se terminer par `.md` (ex : `nouvelle-page.md`).


## 2. Déclarer les pages dans sushi-config.yaml

Dans la section `pages:` de `sushi-config.yaml`, ajoutez chaque fichier markdown à déclarer dans l'IG :

```yaml
pages:
  index.md:
    title: Accueil
  nouvelle-page.md:
    title: Nouvelle page
```

- Le titre sera affiché en haut de la page générée.
- L'ordre des pages dans ce bloc détermine l'ordre de génération.


## 3. Déclarer le menu de navigation

Dans la section `menu:` de `sushi-config.yaml`, structurez le menu comme vous le souhaitez :

```yaml
menu:
  Accueil: index.html
  "Nouvelle page": nouvelle-page.html
  "Section avancée":
    "Sous-page": sous-page.html
```

- Les clés sont les libellés du menu.
- Les valeurs sont les fichiers HTML générés (même nom que le .md mais en .html).
- Pour un sous-menu, utilisez l’imbrication YAML comme ci-dessus.


## 4. Exemple complet

```yaml
pages:
  index.md:
    title: Accueil
  guide-technique.md:
    title: Guide technique
  annexes.md:
    title: Annexes

menu:
  Accueil: index.html
  "Guide technique": guide-technique.html
  Annexes: annexes.html
```


## 5. Bonnes pratiques

- Gardez la structure pages/menu synchronisée avec les fichiers présents dans `input/pages/`.
- Pour masquer une page du menu, ne l’ajoutez pas dans `menu:` (elle reste accessible par URL directe).
- Utilisez des titres clairs et concis.
- Pour des sous-menus, imbriquez les entrées YAML.

## 6. Aller plus loin

- Consultez la doc officielle Sushi : <https://fshschool.org/docs/sushi/configuration/>
- Exemples d’IG HL7 : <https://github.com/HL7/ig-template-base>

---

N’hésitez pas à copier/coller ces exemples pour démarrer rapidement !
