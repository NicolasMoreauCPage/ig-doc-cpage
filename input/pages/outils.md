# Outils et technologies pour les IG FHIR

Développer un Implementation Guide FHIR nécessite un écosystème d'outils complémentaires. Cette page présente les outils essentiels, leur rôle, et comment les utiliser efficacement.

## Chaîne d'outils principale

### FHIR Shorthand (FSH)
**Rôle** : Langage de définition des artefacts FHIR
**Avantages** :
- Syntaxe lisible et concise
- Moins verbeux que JSON/XML
- Validation intégrée
- Génération automatique de documentation

**Installation** :
```bash
npm install -g fsh-sushi
```

**Usage de base** :
```fsh
Profile: MonPatient
Parent: Patient
* name 1..* MS
* birthDate 1..1
```

**Ressources** :
- [Documentation FSH](https://build.fhir.org/ig/HL7/fhir-shorthand/)
- [FSH School](https://fshschool.org/)

### SUSHI (FSH Compiler)
**Rôle** : Compilation FSH vers ressources FHIR
**Fonctionnalités** :
- Génération de StructureDefinitions
- Création d'exemples
- Validation syntaxique
- Génération de snapshots

**Commandes essentielles** :
```bash
sushi .                    # Compilation complète
sushi -s .                # Avec snapshots
sushi --help              # Aide
```

**Dépannage** : Vérifiez les logs pour les erreurs de syntaxe FSH.

### IG Publisher (HL7)
**Rôle** : Génération du site web IG
**Capacités** :
- Validation complète des artefacts
- Génération HTML/CSS/JS
- Rapports de qualité (QA)
- Publication prête

**Configuration** : `ig.ini` et `sushi-config.yaml`

**Lancement** :
```bash
java -jar publisher.jar -ig .
```

**Rapports importants** :
- `output/qa.html` : Rapport qualité
- `output/index.html` : Site généré

### Jekyll (Templating)
**Rôle** : Moteur de génération de sites statiques
**Intégration** : Utilisé par IG Publisher pour le rendu final

**Personnalisation** : Modifiez `template/` pour adapter l'apparence.

## Outils de développement

### Éditeurs et IDE

#### Visual Studio Code
**Extensions recommandées** :
- FHIR Shorthand (pour FSH)
- XML Tools (pour FHIR XML)
- JSON Tools (pour FHIR JSON)

#### Forge (éditeur web)
- Interface graphique pour profils/extensions
- Simplifié pour débutants
- Export vers FSH

### Outils de validation

#### FHIR Validator (ligne de commande)
```bash
java -jar validator.jar -version 4.0.1 mon-fichier.json
```

#### Touchstone (plateforme de test)
- Tests d'interopérabilité
- Validation contre profils
- Certificats de conformité

### Outils de terminologie

#### Ontoserver
- Serveur de terminologie open source
- Support SNOMED CT, LOINC
- API FHIR Terminology

#### TermWeb
- Interface web pour exploration
- Recherche dans les terminologies

## Environnements de développement

### Installation complète (recommandé)

#### Windows (avec droits admin)
1. **Node.js** : [nodejs.org](https://nodejs.org/) (LTS)
2. **Java 17** : [adoptium.net](https://adoptium.net/)
3. **Ruby + Jekyll** : `gem install jekyll bundler`
4. **SUSHI** : `npm install -g fsh-sushi`
5. **IG Publisher** : Télécharger le JAR

#### Windows (sans droits admin)
1. **Node.js portable** : Extraire ZIP dans dossier utilisateur
2. **Java portable** : Archive ZIP dans dossier utilisateur
3. **Ruby portable** : [rubyinstaller.org](https://rubyinstaller.org/) (option utilisateur)
4. **SUSHI local** : `npm install fsh-sushi` (dans projet)
5. **IG Publisher** : JAR dans dossier utilisateur

#### Linux
```bash
# Node.js
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Java
sudo apt install openjdk-17-jdk

# Ruby
sudo apt install ruby-full
sudo gem install jekyll bundler

# SUSHI
sudo npm install -g fsh-sushi
```

### Environnements alternatifs

#### Docker
```bash
# Conteneur avec tous les outils
docker run -it --rm -v $(pwd):/workspace hl7fhir/ig-publisher-base:latest
```

#### GitHub Codespaces
- Environnement cloud prêt à l'emploi
- Configuration automatique des outils
- Collaboration facilitée

## Workflow de développement

### Processus recommandé

1. **Configuration** : Cloner le template, configurer outils
2. **Modélisation** : Créer profils/extensions en FSH
3. **Compilation** : `sushi .` pour générer artefacts
4. **Validation** : IG Publisher pour vérifier qualité
5. **Documentation** : Pages Markdown pour guides
6. **Publication** : Git push pour déclencher CI/CD

### Automatisation

#### Scripts locaux
- `_genonce.sh` : Build complet
- `_gencontinuous.sh` : Surveillance et rebuild automatique

#### Intégration continue
- GitHub Actions pour builds automatiques
- Tests automatisés à chaque push
- Déploiement automatique sur GitHub Pages

## Ressources d'apprentissage

### Documentation officielle
- [HL7 FHIR](https://www.hl7.org/fhir/)
- [IG Publisher Guide](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation)
- [FSH School](https://fshschool.org/)

### Communautés
- [Chat FHIR Zulip](https://chat.fhir.org/)
- [Forum HL7](https://www.hl7.org/participate/forum/)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/fhir)

### Exemples et templates
- [IG Template Base](https://github.com/HL7/ig-template-base)
- [US Core](https://github.com/HL7/US-Core)
- [mCODE](https://github.com/HL7/fhir-mCODE-ig)

## Dépannage courant

### SUSHI ne trouve pas les dépendances
- Vérifier `sushi-config.yaml` (section `dependencies`)
- Relancer `sushi .`

### IG Publisher : erreurs de validation
- Consulter `output/qa.html`
- Corriger les erreurs FSH/JSON
- Vérifier les terminologies

### Jekyll : problèmes de rendu
- Vérifier la syntaxe Markdown
- Contrôler les liens relatifs
- Tester localement : `jekyll serve`

### Performance
- Optimiser les images
- Réduire la complexité des profils
- Utiliser des value sets appropriés

> **Conseil** : Commencez avec le template HL7 et progressez étape par étape. La communauté FHIR est très active pour aider les débutants.