---
title: "Documentation"
layout: page
---

# Documentation

Cette section regroupe la documentation générale de l'IG : contexte, périmètre, ressources couvertes, profils, processus et exemples.

## Contexte et objectif

Décrire le besoin métier, le périmètre fonctionnel et les objectifs visés par l'IG.

## Périmètre et acteurs

Préciser les cas d'usage couverts, les éléments inclus et hors périmètre, ainsi que les acteurs concernés (patient, portail, SI administratif, etc.).

## Ressources FHIR et profils

Lister les ressources principales utilisées (ex : Appointment, Encounter, Coverage, DocumentReference, Consent, QuestionnaireResponse) et les profils spécifiques créés ou réutilisés.

### Profils personnalisés
- MonProfilAppointment : description courte
- MonProfilEncounter : description courte

### Extensions spécifiques
- MonExtensionX : description courte et ressources concernées

## Enchaînement des processus

Présenter les principaux flux métier et l'ordre des interactions (ex : création d'un Appointment, envoi d'un QuestionnaireResponse, création d'un Encounter).

## Exemples de ressources

Exemple JSON pour Appointment :
```json
{
  "resourceType": "Appointment",
  "status": "booked",
  "identifier": [
    { "system": "urn:ietf:rfc:3986", "value": "urn:uuid:1234" }
  ]
}
```

## Artifacts et références

- Liens vers les profils et artefacts (StructureDefinition, ValueSet, OperationDefinition)
- Liens vers le package-list.json et les packages publiés

Retour à l'accueil : [Accueil](index.html)
