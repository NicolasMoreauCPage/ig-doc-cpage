
# FAQ – Questions fréquentes sur les IG FHIR

Cette page rassemble les questions les plus courantes sur le développement, la publication et la maintenance des Implementation Guides FHIR. Si votre question n'y figure pas, consultez la communauté FHIR ou ouvrez une Issue.

## Questions générales

### Qu'est-ce qu'un IG FHIR exactement ?

Un Implementation Guide FHIR est un document technique structuré qui décrit **comment utiliser FHIR** pour un cas d'usage spécifique. Il comprend :

- **Profils** : Contraintes sur les ressources FHIR
- **Extensions** : Nouveaux éléments de données
- **Exemples** : Instances concrètes d'usage
- **Règles métier** : Logique de validation et traitement
- **Documentation** : Guides d'implémentation

Un IG transforme FHIR générique en spécifications opérationnelles pour votre domaine.

### Qui peut créer un IG ?

**Tout le monde !** Les IG sont ouverts à contribution :
- **Équipes produit** : Pour spécifier leurs besoins
- **Intégrateurs** : Pour documenter les implémentations
- **Éditeurs** : Pour standardiser leurs APIs
- **Communautés** : Pour des standards sectoriels

La seule condition : respecter les bonnes pratiques FHIR et HL7.

### Quelle est la différence entre un profil et une extension ?

- **Profil** : Contraint une ressource existante (ex: rendre obligatoire un élément optionnel)
- **Extension** : Ajoute un nouvel élément de donnée non prévu dans le core FHIR

**Règle simple** : Si FHIR a déjà l'élément (même optionnel), utilisez un profil. Sinon, créez une extension.

## Développement technique

### FSH ou JSON/XML pour définir les profils ?

**FSH est recommandé** pour :
- Syntaxe plus lisible et concise
- Moins d'erreurs de frappe
- Maintenance facilitée
- Génération automatique de documentation

Utilisez JSON/XML seulement pour des cas complexes non supportés par FSH.

### Comment valider un IG ?

Plusieurs niveaux de validation :

1. **Syntaxe FSH** : `sushi .` (compilation)
2. **Conformité FHIR** : IG Publisher (`_genonce.sh`)
3. **Qualité** : Rapport QA (`output/qa.html`)
4. **Interopérabilité** : Tests avec consommateurs
5. **Performance** : Tests de charge

**Objectif** : 0 erreur dans les logs IG Publisher.

### SUSHI ne trouve pas mes dépendances

Vérifiez dans `sushi-config.yaml` :
```yaml
dependencies:
  hl7.fhir.uv.core: 4.0.1
  mon-autre-ig: 1.0.0
```

Relancez `sushi .` après modification.

### Comment déboguer une erreur IG Publisher ?

1. **Consultez les logs** : `output/qa.html` et console
2. **Vérifiez la syntaxe** : FSH, JSON, YAML
3. **Testez isolément** : Un profil à la fois
4. **Validez les terminologies** : Codes existants et à jour
5. **Simplifiez** : Retirez temporairement les parties suspectes

### Puis-je modifier les artefacts générés ?

**Non !** Les fichiers dans `fsh-generated/` sont générés automatiquement. Modifiez toujours les sources FSH, puis recompilez.

## Publication et déploiement

### Comment publier sur GitHub Pages ?

1. **Activez Pages** : Settings > Pages > Source: GitHub Actions
2. **Workflow configuré** : `.github/workflows/build-ig.yml` existe
3. **Push** : Le déploiement se fait automatiquement
4. **URL** : `https://votre-user.github.io/votre-repo/`

### Le build GitHub Actions échoue

Causes courantes :
- **Dépendances manquantes** : Vérifiez `sushi-config.yaml`
- **Erreurs FSH** : Testez localement d'abord
- **Timeout** : IG trop volumineux
- **Permissions** : Repository settings

**Solution** : Testez localement avant de pousser.

### Comment gérer les versions ?

Utilisez **semantic versioning** :
- `1.0.0` : Version initiale
- `1.1.0` : Nouvelle fonctionnalité (rétrocompatible)
- `1.1.1` : Correction de bug
- `2.0.0` : Changement cassant

**Pratique** : Tags Git (`git tag v1.0.0`) et releases GitHub.

## Qualité et bonnes pratiques

### Quelles sont les erreurs les plus courantes ?

1. **Profils trop contraignants** : MustSupport partout
2. **Extensions inutiles** : Quand un profil suffit
3. **Terminologies obsolètes** : Codes périmés
4. **Documentation manquante** : Artefacts non documentés
5. **Tests insuffisants** : Pas d'exemples concrets

### Comment assurer la maintenabilité ?

- **Versionnez tout** : Code, documentation, artefacts
- **Documentez les décisions** : Pourquoi ce choix ?
- **Testez automatiquement** : CI/CD
- **Modularisez** : IG petits et spécialisés
- **Communiquez** : Changelog, notes de version

### Faut-il toujours suivre les bonnes pratiques HL7 ?

**Oui, autant que possible**, mais adaptez selon votre contexte :
- **Conformité réglementaire** : Respectez les normes locales
- **Écosystème existant** : Compatibilité avec legacy
- **Adoption** : Facilitez l'implémentation

Documentez toujours vos écarts et leurs justifications.

## Communauté et support

### Où trouver de l'aide ?

- **Documentation officielle** : [hl7.org/fhir](https://www.hl7.org/fhir/)
- **Communauté** : [chat.fhir.org](https://chat.fhir.org/)
- **Forum HL7** : [hl7.org/participate/forum](https://www.hl7.org/participate/forum/)
- **Stack Overflow** : Tag `fhir`
- **Issues GitHub** : Pour les outils spécifiques

### Comment contribuer à un IG existant ?

1. **Clonez le dépôt**
2. **Créez une branche** : `git checkout -b ma-contribution`
3. **Modifiez/ajoutez** : Profils, documentation, exemples
4. **Testez** : Build local réussi
5. **Soumettez une PR** : Décrivez vos changements
6. **Discutez** : Avec les maintainers

### Puis-je réutiliser des IG existants ?

**Absolument !** C'est même recommandé :
- **Dépendances** : Référencez dans `sushi-config.yaml`
- **Héritage** : Étendez des profils existants
- **Composition** : Importez des extensions

Vérifiez les licences et compatibilités de version.

## Problèmes spécifiques

### Terminologies : comment choisir ?

- **Internationales** : SNOMED CT, LOINC, ICD-10
- **Nationales** : Adaptées à votre pays/région
- **Propriétaires** : Seulement si nécessaire
- **Mises à jour** : Vérifiez la fraîcheur des codes

### Performance : IG trop lent à générer

- **Réduisez la complexité** : Profils plus simples
- **Optimisez les terminologies** : Value sets plus petits
- **Parallélisez** : Utilisez des sous-IG
- **Cache** : IG Publisher met en cache

### Sécurité : quelles considérations ?

- **Authentification** : OAuth2, JWT
- **Autorisation** : Rôles et permissions
- **Chiffrement** : TLS 1.3 minimum
- **Audit** : Logs d'accès
- **Confidentialité** : Conformité RGPD/HIPAA

Documentez toujours les exigences de sécurité dans votre IG.

---

**Question manquante ?** Cette FAQ évolue avec vos retours. Ouvrez une Issue pour suggérer de nouvelles questions !

> **Ressource principale** : La page [Bonnes pratiques](bonnes-pratiques.html) pour les recommandations détaillées.
