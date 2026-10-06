# CAHIER DES CHARGES
## Plateforme numérique de prise de rendez-vous de l'Hôpital Psychiatrique de Côte d'Ivoire

**Projet :** « SantéMentale CI — Rendez-vous » (nom provisoire)
**Version :** 1.0 — Octobre 2026
**Destinataires :** Présidence de la République, Ministère de la Santé, de l'Hygiène Publique et de la Couverture Maladie Universelle, Direction de l'établissement
**Statut :** Document de cadrage pour validation

---

## 1. Résumé exécutif

La santé mentale reste un défi majeur de santé publique en Côte d'Ivoire : accès limité aux spécialistes, forte stigmatisation, longues files d'attente et déplacements coûteux, souvent sans certitude d'être reçu.

Ce projet propose une **plateforme web dynamique, responsive et sécurisée** permettant à tout citoyen de **prendre, modifier ou annuler un rendez-vous à l'hôpital psychiatrique depuis son téléphone**, 24h/24, de manière **confidentielle et sans stigmatisation**.

**Bénéfices attendus :**
- Réduction des files d'attente et de l'attente physique
- Réduction des rendez-vous manqués (rappels SMS/WhatsApp)
- Meilleure confidentialité et dignité du patient
- Pilotage de l'activité par des données fiables (aide à la décision publique)
- Vitrine de la transformation numérique de la santé en Côte d'Ivoire

---

## 2. Contexte et enjeux

### 2.1 Contexte
- Prise de rendez-vous actuelle principalement physique ou téléphonique, sans suivi centralisé
- Taux élevé de smartphones et de mobile money dans le pays, mais connectivité parfois irrégulière
- Besoin d'un service accessible à tous, y compris aux personnes peu à l'aise avec le numérique
- *(Chiffres nationaux, nombre de psychiatres, fréquentation annuelle : à compléter avec les données du PNSM et de l'établissement avant présentation.)*

### 2.2 Problèmes à résoudre
| Problème | Réponse de la plateforme |
|---|---|
| Déplacements inutiles, files d'attente | Rendez-vous à créneau fixe, confirmé |
| Rendez-vous non honorés | Rappels automatiques SMS / WhatsApp |
| Stigmatisation | Parcours discret, aucune mention sensible dans les messages |
| Manque de visibilité de l'activité | Tableaux de bord et statistiques |
| Charge administrative du secrétariat | Agenda centralisé et automatisé |
| Accès inégal sur le territoire | Site léger, mobile-first, option USSD/SMS |

---

## 3. Objectifs du projet

**Objectif général :** Faciliter et sécuriser l'accès aux soins psychiatriques par un service de rendez-vous numérique national.

**Objectifs spécifiques (SMART) :**
1. Mettre en ligne la plateforme en **6 mois** (pilote à 4 mois)
2. Atteindre **40 %** des rendez-vous pris via la plateforme à 12 mois
3. Réduire les rendez-vous manqués d'au moins **30 %**
4. Réduire le temps moyen d'attente à l'accueil d'au moins **40 %**
5. Garantir une disponibilité du service ≥ **99,5 %**
6. Atteindre un taux de satisfaction usagers ≥ **80 %**

---

## 4. Périmètre

### 4.1 Inclus
- Site web public responsive (mobile, tablette, ordinateur) et PWA installable
- Espace patient, espace secrétariat, espace médecin, espace administrateur
- Prise de rendez-vous, notifications, paiement en ligne, statistiques
- Pages d'information et de sensibilisation
- Formation, hébergement, maintenance

### 4.2 Hors périmètre (phase 1)
- Dossier médical informatisé complet (prévu en phase 2, interopérable)
- Application mobile native (la PWA couvre le besoin initial)
- Téléconsultation vidéo (option phase 2)

### 4.3 Évolutivité
Architecture conçue pour s'étendre à **d'autres établissements** (CHU, hôpitaux régionaux, centres de santé mentale) sur un modèle multi-sites.

---

## 5. Utilisateurs et rôles

| Rôle | Description | Droits principaux |
|---|---|---|
| **Visiteur** | Citoyen non connecté | Consulter infos, contacts, urgences, FAQ |
| **Patient** | Compte créé | Réserver, modifier, annuler, historique, paiement, documents |
| **Accompagnant / tuteur** | Famille ou représentant légal | Réserver pour un proche (mineur, personne dépendante) avec consentement |
| **Secrétariat / Accueil** | Personnel administratif | Gérer l'agenda, confirmer, reporter, enregistrer les RDV téléphoniques |
| **Médecin / Soignant** | Psychiatre, psychologue, infirmier | Consulter son planning, gérer ses disponibilités, notes de RDV |
| **Administrateur hôpital** | Direction | Paramétrage, statistiques, gestion des utilisateurs |
| **Super-administrateur** | Ministère / DSI | Supervision multi-sites, audit, sécurité |

---

## 6. Exigences fonctionnelles

### 6.1 Site public
- F-01 Page d'accueil claire : présentation de l'hôpital, services, horaires, accès (carte)
- F-02 Présentation des spécialités et des équipes
- F-03 Tarifs et modalités de prise en charge (CMU, assurances, paiement)
- F-04 **Bouton d'urgence permanent** : numéros d'urgence, conduite à tenir en cas de crise, avertissement « la plateforme n'est pas un service d'urgence »
- F-05 Espace information et sensibilisation (articles, FAQ, lutte contre la stigmatisation)
- F-06 Formulaire de contact et d'avis
- F-07 Actualités et campagnes (ex. Journée mondiale de la santé mentale)

### 6.2 Espace patient
- F-10 Inscription par numéro de téléphone (OTP SMS) ou e-mail ; **inscription possible en moins de 2 minutes**
- F-11 Option de rendez-vous en **mode invité** (nom ou pseudonyme + téléphone)
- F-12 Connexion sécurisée, récupération de compte
- F-13 **Réservation en 4 étapes max** : motif général → spécialité/praticien → date et heure → confirmation
- F-14 Affichage des créneaux disponibles en temps réel, sans double réservation
- F-15 Modification et annulation avec règles de délai paramétrables
- F-16 Liste d'attente automatique : notification si un créneau se libère
- F-17 Premier RDV / RDV de suivi, avec durées différentes
- F-18 Réservation pour un proche (accompagnant)
- F-19 Historique des rendez-vous, téléchargement du justificatif
- F-20 Téléversement de documents (ordonnance, lettre d'adressage) en PDF/image, taille limitée et contrôlée
- F-21 Préférences : langue, canal de rappel (SMS / WhatsApp / e-mail), contenu des notifications discret

### 6.3 Paiement
- F-30 Paiement en ligne optionnel ou obligatoire selon le service : **Orange Money, MTN MoMo, Moov Money, Wave**, carte bancaire
- F-31 Paiement sur place conservé
- F-32 Reçu électronique, remboursement en cas d'annulation conforme à la politique
- F-33 Prise en compte de la CMU et des conventions (selon règles de l'établissement)

### 6.4 Notifications
- F-40 Confirmation immédiate de rendez-vous
- F-41 Rappels automatiques (J-2, J-1, H-2, paramétrables)
- F-42 Notifications de report ou annulation par l'hôpital
- F-43 Canaux : SMS, WhatsApp Business, e-mail, notifications push (PWA)
- F-44 **Messages neutres** : aucun terme médical sensible dans le contenu (ex. « Rendez-vous confirmé à l'Hôpital X le … »)

### 6.5 Espace secrétariat / accueil
- F-50 Agenda global par service, praticien, salle, avec vues jour / semaine / mois
- F-51 Création de RDV pour les patients appelant par téléphone ou venant en personne
- F-52 Validation, report, annulation, réaffectation
- F-53 Check-in à l'arrivée du patient (suivi de la file du jour)
- F-54 Gestion des absences, des urgences et surcharges
- F-55 Export de l'agenda (PDF, Excel)
- F-56 Gestion des patients (recherche, fusion de doublons, historique administratif)

### 6.6 Espace médecin / soignant
- F-60 Planning personnel en temps réel
- F-61 Gestion des disponibilités, congés, plages bloquées
- F-62 Consultation de la fiche administrative du patient (périmètre limité)
- F-63 Marquage du statut du RDV (honoré, absent, reporté)
- F-64 Notes de RDV rattachées au patient, accès strictement restreint (prévu comme module chiffré)

### 6.7 Espace administration
- F-70 Gestion des utilisateurs, rôles et permissions (RBAC)
- F-71 Paramétrage : services, praticiens, horaires, durées, jours fériés, tarifs, règles d'annulation
- F-72 Gestion des contenus (CMS) : pages, actualités, FAQ
- F-73 **Tableau de bord décisionnel** : volume de RDV, taux d'absentéisme, délais d'attente, spécialités demandées, répartition géographique (données anonymisées), satisfaction
- F-74 Rapports mensuels exportables, destinés au Ministère
- F-75 Journal d'audit complet (qui a consulté ou modifié quoi, quand)
- F-76 Gestion multi-sites (hôpitaux, centres rattachés)

### 6.8 Inclusion et accessibilité d'accès
- F-80 Interface en **français**, avec langage simple ; extensible aux langues locales (baoulé, dioula, bété… selon priorités) et à l'audio/pictogrammes
- F-81 **Mode « faible débit »** : pages légères, images compressées
- F-82 **Canal alternatif sans smartphone** : prise de RDV par SMS ou USSD (phase 2), et par centre d'appel relié à la même base
- F-83 Parcours assisté : agents d'accueil et relais communautaires pouvant réserver pour un tiers
- F-84 Accessibilité WCAG 2.1 niveau AA (contraste, lecteur d'écran, tailles de police)

---

## 7. Exigences non fonctionnelles

| Domaine | Exigence |
|---|---|
| **Responsive** | Mobile-first, affichage parfait de 320 px à 4K, testé sur Android (priorité) et iOS |
| **Performance** | Chargement < 3 s en 3G ; score Lighthouse ≥ 85 ; poids de page d'accueil < 1 Mo |
| **PWA** | Installable, fonctionnement partiel hors ligne (consultation des RDV déjà chargés) |
| **Disponibilité** | ≥ 99,5 % ; sauvegardes quotidiennes ; plan de reprise d'activité |
| **Scalabilité** | Capacité de 10 000 utilisateurs simultanés à terme ; architecture extensible |
| **Compatibilité** | Chrome, Firefox, Safari, Edge, navigateurs mobiles légers (Opera Mini toléré pour le public) |
| **Maintenabilité** | Code documenté, tests automatisés, intégration continue |
| **Ergonomie** | Tests utilisateurs avec patients, familles et personnel avant mise en production |
| **Langue** | Français ; architecture i18n pour autres langues |

---

## 8. Sécurité, confidentialité et conformité légale

Les données de santé mentale sont **parmi les plus sensibles** : la confiance du public repose sur leur protection.

### 8.1 Cadre légal
- Loi n° 2013-450 du 19 juin 2013 relative à la **protection des données à caractère personnel**, et déclaration/autorisation auprès de l'**ARTCI**
- Loi n° 2013-451 relative à la lutte contre la cybercriminalité
- Respect du **secret médical** et du code de déontologie médicale
- *(Cadre à valider par le conseil juridique et l'ARTCI avant le lancement.)*

### 8.2 Mesures techniques
- Chiffrement des communications (HTTPS/TLS 1.3) et des données sensibles au repos
- Authentification forte pour le personnel (2FA obligatoire)
- Contrôle d'accès par rôle, principe du moindre privilège
- Journalisation et audit des accès au dossier
- Protection contre les attaques courantes (OWASP Top 10, injection, XSS, CSRF, force brute)
- Sauvegardes chiffrées, tests de restauration réguliers
- Audit de sécurité et test d'intrusion avant mise en production, puis annuel
- Anonymisation des données statistiques

### 8.3 Mesures organisationnelles
- Politique de confidentialité claire, consentement explicite et révocable
- Désignation d'un **délégué à la protection des données**
- Charte d'usage signée par tout le personnel habilité
- Procédure de gestion d'incident et de notification de violation de données

### 8.4 Hébergement et souveraineté
- Priorité à un **hébergement national (datacenter en Côte d'Ivoire)** ou sous contrôle de l'État, avec réplication de sauvegarde sécurisée
- Aucune donnée de santé exploitée à des fins commerciales

---

## 9. Architecture technique proposée

### 9.1 Vue d'ensemble
- **Front-end :** application web responsive (React ou Vue.js / Next.js), PWA
- **Back-end :** API REST sécurisée (Node.js/NestJS ou Laravel/Django)
- **Base de données :** PostgreSQL, chiffrement des champs sensibles
- **Cache et files :** Redis (notifications, sessions)
- **Stockage fichiers :** stockage objet chiffré
- **Notifications :** passerelle SMS locale, WhatsApp Business API, e-mail transactionnel
- **Paiement :** agrégateur de mobile money et cartes (type CinetPay, PayDunya ou équivalent, à sélectionner)
- **Cartographie :** OpenStreetMap
- **Supervision :** monitoring, alertes, logs centralisés

### 9.2 Principes
- Architecture modulaire et API-first (interopérabilité future avec le dossier patient et le DHIS2 / systèmes du Ministère)
- Conteneurisation (Docker) et déploiement automatisé (CI/CD)
- Environnements séparés : développement, recette, production
- Technologies ouvertes, éviter la dépendance à un fournisseur unique

---

## 10. Design et expérience utilisateur

- Univers **apaisant, humain et rassurant** : couleurs douces, typographie lisible, ton bienveillant
- Identité aux couleurs nationales de manière sobre, validée par l'établissement
- Parcours épuré, grands boutons, peu de texte, icônes explicites
- Visuels respectueux, représentatifs de la population ivoirienne, sans imagerie stigmatisante
- Tests utilisateurs avec différents profils (jeunes, personnes âgées, faible alphabétisation)
- Charte graphique et maquettes validées avant développement

---

## 11. Gouvernance et organisation du projet

| Instance | Rôle |
|---|---|
| **Comité de pilotage** | Présidence / Ministère / Direction hôpital : orientations, arbitrages, validation des jalons |
| **Comité technique** | DSI, prestataire, experts sécurité : suivi d'avancement |
| **Équipe projet** | Chef de projet, UX/UI designer, développeurs front/back, DevOps, expert sécurité, testeur QA, formateur |
| **Référents métier** | Psychiatres, secrétariat, travailleurs sociaux : expression des besoins et recette |

Méthode : **Agile (Scrum)**, livraisons par incréments toutes les 2 à 3 semaines, démonstrations régulières.

---

## 12. Planning prévisionnel (6 mois)

| Phase | Durée | Contenu | Livrables |
|---|---|---|---|
| **0. Cadrage** | Mois 1 | Ateliers, analyse de l'existant, validation juridique | Spécifications détaillées, maquettes |
| **1. Conception** | Mois 1–2 | UX/UI, architecture, modèle de données | Prototype cliquable, dossier d'architecture |
| **2. Développement** | Mois 2–4 | Modules patient, secrétariat, médecin, admin, paiement, notifications | Version bêta |
| **3. Pilote** | Mois 4–5 | Test en conditions réelles sur un service, formation | Rapport de pilote, corrections |
| **4. Audit et recette** | Mois 5 | Audit sécurité, tests de charge, recette finale | PV de recette |
| **5. Déploiement** | Mois 6 | Mise en production, communication, formation générale | Plateforme en service |
| **6. Suivi** | Après lancement | Maintenance, support, évolutions | Rapports mensuels |

---

## 13. Formation et accompagnement du changement

- Formation du secrétariat, des soignants et des administrateurs (présentiel + guides)
- Guide vidéo court pour les patients (format mobile)
- **Campagne de communication nationale** : radio, TV, réseaux sociaux, affichage, relais communautaires et associations
- Équipe de support : hotline, e-mail, WhatsApp
- Période d'accompagnement renforcé de 3 mois après le lancement

---

## 14. Indicateurs de performance (KPI)

- Nombre de comptes créés et de rendez-vous pris en ligne
- Taux d'absentéisme avant / après
- Délai moyen d'obtention d'un rendez-vous
- Taux de remplissage des agendas
- Temps moyen de réservation
- Taux de satisfaction (enquête post-RDV)
- Disponibilité technique et temps de réponse
- Répartition géographique de la demande

---

## 15. Risques et mesures de mitigation

| Risque | Impact | Mitigation |
|---|---|---|
| Fracture numérique | Exclusion de patients | Canal SMS/USSD, centre d'appel, agents d'accueil |
| Connectivité instable | Frustration | PWA, pages légères, mode faible débit |
| Fuite de données | Très critique | Chiffrement, audit, 2FA, DPO, plan d'incident |
| Résistance au changement | Faible adoption | Formation, implication des équipes, pilote |
| Pannes ou coupures | Indisponibilité | Redondance, sauvegardes, plan de reprise |
| Dépendance au prestataire | Pérennité | Code source et documentation remis à l'État, technologies ouvertes |
| Dépassement budgétaire/délais | Retard | Agile, jalons validés, réserve de contingence |

---

## 16. Budget (structure à chiffrer)

*Les montants sont à établir après consultation de prestataires ; le tableau fixe la structure de l'enveloppe.*

| Poste | Montant (FCFA) |
|---|---|
| Cadrage, UX/UI, conception | À chiffrer |
| Développement (front, back, PWA) | À chiffrer |
| Intégrations (paiement, SMS, WhatsApp) | À chiffrer |
| Hébergement sécurisé (an 1) | À chiffrer |
| Audit de sécurité et tests | À chiffrer |
| Formation et communication | À chiffrer |
| Maintenance et support (an 1) | À chiffrer |
| Contingence (10 %) | À chiffrer |
| **Total** | **À chiffrer** |

**Modèles de financement possibles :** budget de l'État, partenariats (OMS, Banque mondiale, UNICEF, coopérations bilatérales), mécénat d'entreprises et opérateurs télécom.

---

## 17. Livrables

1. Spécifications fonctionnelles et techniques détaillées
2. Charte graphique et maquettes validées
3. Plateforme web/PWA en production
4. Code source, documentation technique et d'exploitation
5. Rapport d'audit de sécurité
6. Supports de formation
7. Plan de maintenance et SLA
8. Rapports de suivi des KPI

---

## 18. Critères d'acceptation (recette)

- 100 % des fonctionnalités prioritaires validées en recette
- Aucune faille critique ou majeure à l'audit
- Tests de charge réussis (volume cible)
- Conformité WCAG AA et affichage correct sur les appareils cibles
- Formation réalisée pour au moins 90 % du personnel concerné
- Validation conformité données personnelles (ARTCI)

---

## 19. Évolutions futures (feuille de route)

- **Phase 2 :** Téléconsultation, USSD/SMS, dossier patient informatisé, assistant d'orientation (FAQ intelligente)
- **Phase 3 :** Déploiement national multi-établissements, interopérabilité avec le système national d'information sanitaire, carte nationale de l'offre de santé mentale
- **Vision :** Faire de la Côte d'Ivoire un **modèle africain** de santé mentale numérique, accessible, digne et souverain

---

## 20. Argumentaire pour la décision

1. **Impact social :** accès aux soins facilité, dignité et confidentialité renforcées
2. **Efficacité publique :** moins de pertes de temps et de ressources, meilleure gestion des agendas
3. **Données pour décider :** statistiques fiables pour orienter les politiques de santé mentale
4. **Modernisation :** projet concret aligné avec la stratégie de transformation numérique de l'État
5. **Souveraineté :** données hébergées et maîtrisées en Côte d'Ivoire
6. **Reproductibilité :** modèle extensible à tous les établissements de santé du pays
7. **Visibilité internationale :** projet exemplaire pouvant attirer partenaires et financements

---

## Annexes à compléter avant présentation

- Statistiques nationales et locales de santé mentale (PNSM, OMS, hôpital)
- Organigramme et services de l'établissement
- Cartographie des processus actuels de prise de rendez-vous
- Avis juridique (données personnelles, secret médical)
- Devis des prestataires et budget définitif
- Lettres de soutien des partenaires
