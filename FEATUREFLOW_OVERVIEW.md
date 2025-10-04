# FeatureFlow - App Übersicht

## Was ist FeatureFlow?

FeatureFlow ist ein **Feature Request & Feedback Management System** für iOS/macOS Apps. Es ermöglicht Nutzern, Feature-Wünsche einzureichen, darüber abzustimmen und Kommentare zu hinterlassen. Entwickler können den Status von Features verfolgen und sehen, welche Features am meisten gewünscht werden.

## Hauptfunktionen

### Für End-Nutzer (Mobile/iOS SDK):
- ✨ **Feature Requests einreichen** - Nutzer können neue Feature-Wünsche mit Titel und Beschreibung einreichen
- 👍 **Voting-System** - Jeder Nutzer kann einmal pro Feature abstimmen (basierend auf Device-ID)
- 💬 **Kommentare** - Diskussion und Feedback zu einzelnen Features
- 📊 **Feature-Status verfolgen** - Sehen ob ein Feature geplant, in Arbeit oder fertiggestellt ist

### Für Entwickler (Web Dashboard):
- 📱 **App-Verwaltung** - Nach Anmeldung neue Apps hinzufügen mit automatisch generierter App-ID
- 📊 **Dashboard** - Übersicht über alle Apps mit Statistiken (Anzahl Features, Votes, Kommentare)
- 🎯 **Priorisierung** - Sehen welche Features die meisten Votes haben
- 🔄 **Status-Management** - Features zwischen verschiedenen Status verschieben (offen, geplant, in Arbeit, fertig)

## Technische Architektur

### Backend (Supabase):

**Datenbank-Tabellen:**

1. **apps** - App-Verwaltung
   - `id` (UUID, Primary Key)
   - `app_id` (String, Unique) - Die öffentliche App-ID
   - `name` (String)
   - `created_at` (Timestamp)
   - `owner_user_id` (UUID) - Verknüpfung zum Nutzer

2. **features** - Feature Requests
   - `id` (UUID, Primary Key)
   - `app_id` (String) - Verknüpfung zur App
   - `title` (String)
   - `description` (String)
   - `status` (Enum: 'open', 'planned', 'in_progress', 'completed')
   - `votes_count` (Integer)
   - `created_at` (Timestamp)

3. **votes** - User-Votes
   - `id` (UUID, Primary Key)
   - `feature_id` (UUID) - Verknüpfung zum Feature
   - `user_identifier` (String) - Device-ID oder User-ID
   - `created_at` (Timestamp)
   - Unique Constraint auf (feature_id, user_identifier)

4. **comments** - Kommentare zu Features
   - `id` (UUID, Primary Key)
   - `feature_id` (UUID) - Verknüpfung zum Feature
   - `author_name` (String)
   - `text` (String)
   - `created_at` (Timestamp)

### Frontend (Next.js):

**Authentifizierung:**
- Supabase Auth für User-Login/Registration

**Hauptseiten:**

1. **Landing Page** (`/`)
   - Erklärung was FeatureFlow ist
   - Login/Signup Buttons

2. **Dashboard** (`/dashboard`)
   - Übersicht aller Apps des eingeloggten Users
   - Statistiken pro App:
     - Anzahl Features (gesamt, nach Status)
     - Gesamtanzahl Votes
     - Anzahl Kommentare
   - "Neue App hinzufügen" Button

3. **App-Detailseite** (`/app/[appId]`)
   - Liste aller Features für diese App
   - Sortiert nach Votes (höchste zuerst)
   - Filter nach Status
   - Feature-Details mit Kommentaren

4. **App erstellen** (`/app/new`)
   - Formular: App-Name eingeben
   - Automatische Generierung einer App-ID (z.B. UUID oder lesbarer String)
   - Speichern in Supabase `apps` Tabelle
   - Weiterleitung zum Dashboard

### iOS/macOS SDK (Swift Package):

**Hauptkomponenten:**

1. **FeatureFlowView** - Einbindbare SwiftUI View
   - Zeigt alle Features für eine App-ID
   - Integriert: Liste, Submit-Formular, Detail-Ansicht

2. **SupabaseClient** - API-Client
   - `fetchFeatures(appId:)` - Lädt alle Features
   - `submitFeature(appId:, title:, description:)` - Neues Feature einreichen
   - `upvoteFeature(_:)` - Vote abgeben
   - `addComment(to:, authorName:, text:)` - Kommentar hinzufügen

3. **Models**
   - `Feature` - Feature mit allen Infos
   - `Vote` - Vote-Eintrag
   - `Comment` - Kommentar-Eintrag

## Status-System

Features durchlaufen folgende Stati:

- **Offen** (open) - Neu eingereicht, noch nicht bearbeitet - Grau
- **Geplant** (planned) - Vom Team für Umsetzung vorgesehen - Blau
- **In Arbeit** (in_progress) - Wird gerade entwickelt - Orange
- **Fertig** (completed) - Feature ist live - Grün

## Integration für Entwickler

### Schritt 1: Web-Dashboard
1. Bei FeatureFlow registrieren
2. Neue App anlegen → App-ID wird generiert (z.B. `my-awesome-app-123`)

### Schritt 2: iOS App Integration
```swift
import FeatureFlow

// In ContentView oder Settings
FeatureFlowView(appId: "my-awesome-app-123")
```

Das war's! Die View ist komplett selbstständig.

## Frontend Tech Stack (Next.js Boilerplate)

**Komponenten-Strategie:**
- Primär: Vorhandene Boilerplate-Komponenten nutzen (Buttons, Forms, Cards, etc.)
- Fallback: shadcn/ui Server-Komponenten für fehlende UI-Elemente
- Dashboard-Charts: shadcn Charts oder Recharts für Statistiken

**Wichtige Seiten:**
- Authentication: Supabase Auth Integration
- Dashboard: Übersichtskarten mit Stats pro App
- App-Management: CRUD für Apps

## Supabase Setup

**Environment Variables:**
```env
NEXT_PUBLIC_SUPABASE_URL=https://ssaaaryvzpmfefvnfpxf.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

**Row Level Security (RLS):**
- Apps sind nur für den Owner sichtbar/editierbar
- Features sind öffentlich lesbar (per App-ID)
- Votes haben Unique Constraint pro User/Device
- Kommentare sind öffentlich lesbar

## User Flow

### Mobile User (iOS App):
1. Öffnet Feature Request Tab in App
2. Sieht alle bestehenden Feature-Wünsche sortiert nach Votes
3. Kann für Features voten (einmal pro Device)
4. Kann neue Features einreichen
5. Kann Kommentare schreiben

### Developer (Web Dashboard):
1. Registriert sich / Loggt sich ein
2. Landet auf Dashboard → sieht alle eigenen Apps
3. Klickt "Neue App" → gibt Namen ein → App-ID wird generiert
4. Kopiert App-ID für iOS-Integration
5. Sieht in App-Details alle eingereichten Features
6. Kann Status ändern (z.B. "Geplant" → "In Arbeit")
7. Sieht Statistiken: Welche Features haben die meisten Votes?

## Daten-Flow Beispiel

**Nutzer submitted Feature:**
1. iOS App: `SupabaseClient.submitFeature(appId: "app-123", title: "Dark Mode", description: "...")`
2. POST zu Supabase `/features` Tabelle
3. Feature wird mit Status "open" und votes_count=0 angelegt
4. iOS App refresht Liste → neues Feature erscheint

**Nutzer votet:**
1. iOS App: `SupabaseClient.upvoteFeature(feature)`
2. POST zu `/votes` Tabelle (feature_id + device_id)
3. PATCH zu `/features` → votes_count +1
4. Vote-Status wird lokal in UserDefaults gespeichert (verhindert Doppel-Voting)
5. iOS App refresht Liste → Feature hat jetzt mehr Votes

**Developer ändert Status:**
1. Web Dashboard: Feature-Card → Status-Dropdown → "In Arbeit" wählen
2. PATCH zu Supabase `/features` Tabelle → status="in_progress"
3. iOS App aktualisiert automatisch beim nächsten Fetch → Badge wird orange

## Next Steps für Frontend-Entwicklung

1. **Auth Setup**: Supabase Auth Provider in Next.js einbinden
2. **Protected Routes**: Middleware für Dashboard-Seiten
3. **Dashboard**: Grid mit App-Cards (Name, Stats, "Details" Button)
4. **App Creation**: Formular + UUID/ID Generator + Supabase Insert
5. **App Details**: Feature-Liste mit Tabelle/Cards, Status-Badges, Vote-Counts
6. **Responsive Design**: Mobile-first approach
7. **shadcn Components**: Button, Card, Badge, Form, Dialog, Tabs, etc.
