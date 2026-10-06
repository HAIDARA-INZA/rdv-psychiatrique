# 🏥 Prise de rendez-vous — Hôpital psychiatrique (Côte d'Ivoire)

Plateforme web responsive de prise de rendez-vous pour un hôpital psychiatrique : parcours patient confidentiel, agenda du secrétariat, planning des médecins et statistiques pour la décision publique.

> Prototype de démonstration avec **données fictives**. Ne jamais y enregistrer de vraies données de patients sans hébergement sécurisé, audit et validation ARTCI (voir le cahier des charges).

## Contenu du dépôt

| Dossier | Contenu |
|---|---|
| `docs/cahier-des-charges.md` | Cahier des charges complet (contexte, exigences fonctionnelles et non fonctionnelles, sécurité, planning, budget, risques) |
| `database/schema.sql` | Tables du projet et données fictives (services, praticiens, disponibilités) |
| `laravel-files/` | Code de l'application (voir `LISEZMOI.md` dans ce dossier) |

## Fonctionnalités

- **Site public** : présentation, services, bandeau d'**urgence** permanent
- **Patient** : inscription par téléphone, réservation en 4 étapes (service → praticien → créneau → confirmation), mode de paiement mobile money simulé, aperçu d'un SMS de rappel **neutre**, annulation
- **Secrétariat** : agenda par jour, statuts (honoré, absent, annulé), rendez-vous pris par téléphone ou à l'accueil
- **Médecin** : planning personnel, voit le motif de consultation (que le secrétariat ne voit pas)
- **Administrateur** : tableau de bord (rendez-vous, taux d'absentéisme, demande par service, activité par jour)

## Pile technique

Laravel (API REST, `DB::table`) · MySQL · React 18 + htm + Tailwind (CDN, sans compilation) · PWA · jetons d'API hachés (SHA-256) avec rôles `patient`, `secretary`, `doctor`, `admin`.

## Sécurité et confidentialité (déjà en place)

- **Zéro double réservation** : index unique `appointments.slot_lock` (praticien + horaire), libéré à l'annulation
- Contrôle des rôles côté serveur ; le médecin n'accède qu'à ses propres rendez-vous
- Motif de consultation visible uniquement du médecin concerné
- Notifications à contenu neutre (aucun terme médical)
- Limitation de débit sur la connexion, journal d'audit (`audit_log`)
- Limite de 5 rendez-vous à venir par patient, réservation limitée à 60 jours

## Installation sur cPanel

1. Sous-domaine en **PHP 8.3**, Laravel installé dans `laravel`, racine du document sur `…/laravel/public`.
2. `.env` : `APP_ENV=production`, `APP_DEBUG=false`, `APP_URL=https://votre-domaine`, `APP_TIMEZONE=Africa/Abidjan`.
3. Copier les fichiers de `laravel-files/` dans `laravel`.
4. phpMyAdmin → onglet **SQL** → importer `database/schema.sql` (modifie la table `users` de Laravel).
5. Créer les comptes de démonstration (secrétariat, médecin, admin, patient) avec un mot de passe de test.

## À faire avant une vraie mise en production

- Hébergement sécurisé et souverain (VPS dédié ou datacenter en Côte d'Ivoire), sauvegardes chiffrées
- Validation juridique (loi n° 2013-450, ARTCI), audit de sécurité, chiffrement des champs sensibles
- SMS / WhatsApp et paiement mobile money réels (CinetPay, PayDunya…)
- Remplacer les données et comptes fictifs, régénérer `APP_KEY`, `APP_DEBUG=false`

Voir `docs/cahier-des-charges.md` pour le détail complet.
