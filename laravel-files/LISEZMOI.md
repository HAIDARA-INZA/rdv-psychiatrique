# Code de l'application

Placer ici les fichiers du projet, **tels qu'ils tournent sur le serveur** :

```
app/Http/Controllers/   AuthController, BookingController, StaffController, AdminController
app/Http/Middleware/    ApiAuth.php
bootstrap/app.php
routes/                 api.php, web.php
public/                 app.html, manifest.json, icon.svg, sw.js (+ modern.css / modern.js)
```

Récupération depuis cPanel : Gestionnaire de fichiers → sélectionner ces dossiers/fichiers → **Compresser**
→ télécharger le zip → le décompresser ici. **Ne jamais ajouter** `.env`, `vendor/` ni `storage/`.
