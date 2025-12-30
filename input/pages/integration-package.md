# Intégration du package IG FHIR (.tgz/.zip) dans les serveurs FHIR

Après la génération de votre Implementation Guide FHIR, un package NPM (généralement nommé `mon-ig-1.0.0.tgz` ou `.zip`) est produit. Ce package est le format standard pour distribuer un IG FHIR et faciliter son intégration dans les serveurs et outils FHIR modernes.

## Contenu du package
- Ressources de conformance : StructureDefinition, ValueSet, CodeSystem, CapabilityStatement, etc.
- Fichier `package.json` : identifiant, version, fhirVersion, dépendances
- Documentation et exemples

## Méthodes d'intégration selon la plateforme

### 1. Import direct du package (.tgz)
Certains serveurs (ex : HAPI FHIR, Aidbox) permettent de charger le package `.tgz` directement via leur interface ou un outil dédié. Les profils, ValueSet, CodeSystem, etc. sont alors enregistrés automatiquement dans le serveur.

### 2. Décompression et import manuel
D'autres solutions demandent de décompresser le package, puis d'importer les ressources individuellement (API REST, script, outil comme UploadFIG).

### Exemple d'intégration dans HAPI FHIR
- **Interface d'administration** : Import du package NPM dans "Implementation Guides"
- **API REST** : Utilisation de l'endpoint `/ImplementationGuide` pour charger les ressources
- **Script** : Décompression du `.tgz` et POST des fichiers JSON sur le serveur

[Documentation HAPI FHIR](https://hapifhir.io/doc_fhir_implementation_guides.html)

## Bonnes pratiques
- Vérifiez la compatibilité de la version FHIR du package avec celle du serveur
- Contrôlez les dépendances dans le `package.json`
- Consultez la documentation de votre serveur pour la procédure exacte d'import
- Pour les serveurs ne supportant pas l'import direct, utilisez un script pour poster les ressources

---

Cette page fait partie du guide documentaire IG FHIR CPage. Retour à la [Prise en main rapide](quickstart.html).
