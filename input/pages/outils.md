# Outils et technologies pour les IG FHIR

Développer un Implementation Guide FHIR nécessite un ensemble d'outils complémentaires. Cette page présente les outils essentiels, leur rôle et leur utilisation.

## Chaîne d'outils principale

### FHIR Shorthand (FSH)
Langage de définition des artefacts FHIR, syntaxe lisible et concise, moins verbeux que JSON/XML, validation intégrée, génération automatique de documentation.

Installation :
```bash
npm install -g fsh-sushi
```

Usage de base :
```fsh
Profile: MonPatient
Parent: Patient
* name 1..* MS
* birthDate 1..1
```

Ressources :
- [Documentation FSH](https://build.fhir.org/ig/HL7/fhir-shorthand/)
- [FSH School](https://fshschool.org/)

### SUSHI (FSH Compiler)
Compilation FSH vers ressources FHIR, génération de StructureDefinitions, création d'exemples, validation syntaxique, génération de snapshots.

Commandes essentielles :
```bash
sushi .                    # Compilation complète
sushi -s .                # Avec snapshots
sushi --help              # Aide
```

Dépannage : vérifier les logs pour les erreurs de syntaxe FSH.

### IG Publisher (HL7)
Génération du site web IG, validation complète des artefacts, génération HTML/CSS/JS, rapports de qualité (QA), publication prête.

### GoFSH (conversion inverse)
Convertir des StructureDefinitions JSON/XML existants en FSH
**Utilité** :
- Facilite la migration d’anciens projets ou la récupération de profils existants
- Permet de générer du FSH à partir de ressources déjà publiées

**Commandes clés** :
```bash
gofsh .                       # Conversion de tous les JSON du dossier
gofsh -t json-and-xml .       # Conversion JSON + XML
gofsh --fshing-trip           # Conversion + compilation + comparaison automatique
```


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

> 📋 **Note importante** : Les instructions ci-dessous concernent l'utilisation du **template IG CPage**, qui est **réservé aux projets CPage uniquement**. Ce template intègre des configurations spécifiques (styles, workflows, conformité) adaptées à l'écosystème CPage. Pour des projets externes, utilisez le [template officiel HL7](https://github.com/HL7/ig-template-base).

### Installation complète (recommandé)

#### Windows (avec droits admin)
1. **Node.js** : [nodejs.org](https://nodejs.org/) (LTS)
2. **Java 17** : [adoptium.net](https://adoptium.net/)
3. **Ruby + Jekyll** : `gem install jekyll bundler`
4. **SUSHI** : `npm install -g fsh-sushi`
5. **IG Publisher** : Télécharger le JAR

#### Windows (sans droits admin) - GUIDE DÉTAILLÉ POUR DÉBUTANTS

Si vous n'avez pas les droits administrateur sur votre machine Windows (cas fréquent en entreprise), voici un guide **pas à pas** pour installer tous les outils nécessaires.

##### 1. Préparation : Créer un dossier pour les outils
```cmd
mkdir C:\MesOutilsFHIR
cd C:\MesOutilsFHIR
```

##### 2. Node.js portable
**Pourquoi ?** Nécessaire pour SUSHI et les outils JavaScript
**Téléchargement :** [nodejs.org/download](https://nodejs.org/en/download/) → Windows Binary (.zip)
**Étapes :**
1. Téléchargez `node-v18.x.x-win-x64.zip` (version LTS)
2. Extrayez le ZIP dans `C:\MesOutilsFHIR\nodejs\`
3. Testez : `C:\MesOutilsFHIR\nodejs\node.exe -v`

**Configuration PATH temporaire :**
```cmd
set PATH=C:\MesOutilsFHIR\nodejs;%PATH%
node -v
npm -v
```

##### 3. Java portable
**Pourquoi ?** Requis pour IG Publisher
**Téléchargement :** [adoptium.net/temurin/releases](https://adoptium.net/temurin/releases/) → Windows x64 ZIP
**Étapes :**
1. Téléchargez `OpenJDK17U-jdk_x64_windows_hotspot_17.x.x.zip`
2. Extrayez dans `C:\MesOutilsFHIR\java\`
3. Testez : `C:\MesOutilsFHIR\java\bin\java.exe -version`

**Configuration PATH temporaire :**
```cmd
set PATH=C:\MesOutilsFHIR\java\bin;%PATH%
java -version
```

##### 4. Ruby portable pour Jekyll
**Pourquoi ?** Pour la génération du site web
**Téléchargement :** [rubyinstaller.org](https://rubyinstaller.org/) → WITH DEVKIT (option utilisateur)
**Étapes :**
1. Téléchargez `rubyinstaller-devkit-3.2.x-x64.exe`
2. Lors de l'installation :
   - Cochez "Install Ruby for all users" → NON
   - Répertoire : `C:\MesOutilsFHIR\ruby`
3. Ouvrez l'invite Ruby : Menu Démarrer → Ruby → Start Command Prompt with Ruby
4. Installez Jekyll : `gem install jekyll bundler`
5. Testez : `jekyll -v`

##### 5. SUSHI (local dans le projet)
**Pourquoi ?** Compiler FSH vers FHIR
**Installation :**
```cmd
# Dans votre dossier IG (pas besoin d'admin)
cd C:\MonProjetIG
npm install fsh-sushi
```

**Utilisation :**
```cmd
# Utiliser SUSHI local
npx sushi .
```

##### 6. IG Publisher
**Pourquoi ?** Générer le site web final
**Téléchargement :** [github.com/HL7/fhir-ig-publisher/releases](https://github.com/HL7/fhir-ig-publisher/releases)
**Étapes :**
1. Téléchargez `publisher.jar` (dernière version)
2. Placez dans `C:\MesOutilsFHIR\publisher.jar`

**Utilisation :**
```cmd
java -jar C:\MesOutilsFHIR\publisher.jar -ig .
```

##### 7. Script de lancement automatique (recommandé)
Créez `C:\MesOutilsFHIR\lancer-ig.bat` :
```bat
@echo off
echo Configuration des outils FHIR...

set PATH=C:\MesOutilsFHIR\nodejs;%PATH%
set PATH=C:\MesOutilsFHIR\java\bin;%PATH%

echo Node.js version:
node -v
echo NPM version:
npm -v
echo Java version:
java -version

echo Outils configurés ! Vous pouvez maintenant utiliser SUSHI et IG Publisher.
cmd
```

**Utilisation :** Double-cliquez sur `lancer-ig.bat` pour ouvrir un terminal configuré.

##### 8. Vérifications finales
```cmd
# Dans le terminal configuré
node -v          # Devrait afficher la version
npm -v           # Devrait afficher la version
java -version    # Devrait afficher Java 17
jekyll -v        # Devrait afficher Jekyll
npx sushi -v     # Devrait afficher SUSHI
```

##### Dépannage installation sans admin

**Problème : "command not found"**
- Vérifiez que vous utilisez le bon terminal (celui lancé par `lancer-ig.bat`)
- Relancez `lancer-ig.bat` si nécessaire

**Problème : Droits insuffisants**
- Vérifiez que vous installez dans votre dossier utilisateur (`C:\Users\VotreNom\`)
- Évitez `C:\Program Files\`

**Problème : Ruby ne s'installe pas**
- Utilisez l'installeur Ruby avec l'option "utilisateur seulement"
- Fermez tous les terminaux Ruby avant l'installation

**Problème : SUSHI lent**
- Utilisez `npm install fsh-sushi --production` pour une installation plus légère

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

> **Conseil** : Travaillez par petites itérations, validez chaque étape (modélisation, compilation, validation) avant de passer à la suivante. Utilisez les scripts automatiques (`_genonce.sh`, `_gencontinuous.sh`) pour gagner du temps.

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

## Liens utiles

### Exemples d'Implementation Guides

Des exemples concrets pour s'inspirer :

- **US Core** : [Publication](https://hl7.org/fhir/us/core/), [GitHub](https://github.com/HL7/US-Core)
- **mCODE** (basé sur US Core) : [Publication](http://hl7.org/fhir/us/mcode/), [GitHub](https://github.com/HL7/fhir-mCODE-ig)
- **SDC** (Structured Data Capture) : [Publication](http://hl7.org/fhir/uv/sdc/index.html), [GitHub](https://github.com/HL7/sdc)

### Éditeur FSH en ligne

- [FSH School](https://fshschool.org/) : Éditeur FSH interactif avec tutoriels
- [Documentation FSH](https://build.fhir.org/ig/HL7/fhir-shorthand/)

### Autres ressources

- [IG Publisher - Documentation officielle HL7](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation)
- [Clinical Quality Language (CQL)](https://cql.hl7.org/) : Langage d'expression FHIR

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