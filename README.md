# Template d'IG FHIR CPage

Template personnalisé pour les Implementation Guides FHIR avec branding CPage.

## 🚀 Utilisation

### Génération

Le branding CPage est entièrement géré par le *template* (ig-template-cpage). Pour générer l'IG :

```bash
./_genonce.sh
```

Explications :
- Le template apporte le logo, les styles CSS et tous les assets de branding.
- Il ne doit pas exister de script d'application de branding dans le dépôt de l'IG.
- Si vous utilisez un template distant (GitHub), assurez-vous que `ig.ini` référence le template correct.

## 🎨 Branding CPage

Le template inclut :
- **Logo CPage** dans la navbar
- **Couleurs CPage** : Bleu (#0063dc), jaune (#ffc800) et turquoise (#5ad0c6)
- **Texte personnalisé** : "CPage FHIR IG"
- **Support français** complet

## 📁 Structure

```
FHIR_IG/
├── ig.ini                    # Configuration IG
├── input/                    # Contenu source
├── output/                   # IG générée
├── scripts/                  # Scripts de génération
├── _genonce.sh               # Script de génération (utilise le template)
└── template/                 # Template local (optionnel)
```

## 🔧 Template personnalisé

Le template CPage est disponible sur GitHub :
- **Repository** : https://github.com/NicolasMoreauCPage/ig-template-cpage
- **Base** : Extension de `fhir.base.template`

## 📋 Prérequis

- Java 17+
- FHIR IG Publisher
- Git

## 🆘 Support

En cas de problème, vérifier :
1. Que le logo `logo-cpage.png` est présent dans `output/assets/images/`
2. Que les scripts sont exécutables (`chmod +x *.sh`)
3. Que le template est correctement chargé (visible dans les logs)
