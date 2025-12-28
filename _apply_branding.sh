#!/bin/bash
# Script pour appliquer automatiquement le branding CPage après génération IG

echo "🔄 Application automatique du branding CPage..."

# Vérifier que le dossier output existe
if [ ! -d "output" ]; then
    echo "❌ Erreur: dossier output non trouvé"
    exit 1
fi

# Copier les assets du template
echo "📋 Copie des assets CPage..."
mkdir -p output/assets/images
cp "../ig-template-cpage/template/content/assets/images/logo-cpage.png" "output/assets/images/" 2>/dev/null || echo "⚠️  Logo non trouvé dans le template"
cp "../ig-template-cpage/template/content/assets/css/project.css" "output/assets/css/" 2>/dev/null || echo "⚠️  CSS non trouvé dans le template"

# Appliquer le branding à index.html
if [ -f "output/index.html" ]; then
    echo "🎨 Application du branding à index.html..."

    # Sauvegarder l'original (une seule fois)
    if [ ! -f "output/index.html.original" ]; then
        cp output/index.html output/index.html.original
    fi

    # Remplacer la navbar par celle de CPage
    sed -i 's|<a href="http://hl7.org/fhir/R4/index.html" class="navbar-brand hidden">FHIR</a>|<a href="./" class="navbar-brand" style="color: #7fb800 !important;"><img src="assets/images/logo-cpage.png" alt="CPage Logo" height="30" style="margin-right: 10px; vertical-align: middle;">CPage FHIR IG</a>|g' output/index.html

    # Modifier les styles de la navbar
    sed -i 's|<nav class="navbar navbar-inverse">|<nav class="navbar navbar-inverse" style="background-color: #003d7a !important;">|g' output/index.html

    echo "✅ Branding CPage appliqué avec succès !"
else
    echo "❌ Erreur: index.html non trouvé"
fi

echo "🎉 IG avec branding CPage prête dans output/"