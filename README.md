# Flutter Firebase Social

Una aplicación de red social construida con Flutter, Firebase, Riverpod y GoRouter.

## 🚀 Características

- ✅ Autenticación con Firebase Auth (Email/Password)
- ✅ Diseño moderno con gradientes y animaciones
- ✅ Navegación con GoRouter
- ✅ Gestión de estado con Riverpod
- ✅ Validación de formularios
- ✅ Manejo de errores en español

## 📋 Requisitos Previos

- Flutter SDK (>=3.9.2)
- Cuenta de Firebase (gratuita)
- Node.js (para FlutterFire CLI)

## 🔧 Configuración de Firebase

### Opción 1: Usando FlutterFire CLI (Recomendado)

1. **Instala FlutterFire CLI**:
   ```bash
   dart pub global activate flutterfire_cli
   ```

2. **Inicia sesión en Firebase**:
   ```bash
   firebase login
   ```

3. **Configura Firebase para tu proyecto**:
   ```bash
   flutterfire configure
   ```
   
   Esto creará automáticamente:
   - `lib/firebase_options.dart`
   - `android/app/google-services.json`
   - `ios/Runner/GoogleService-Info.plist`

4. **Selecciona tu proyecto de Firebase** o crea uno nuevo cuando se te solicite.

5. **Selecciona las plataformas** que deseas soportar (Android, iOS, Web, etc.).

### Opción 2: Configuración Manual

Si prefieres configurar Firebase manualmente:

1. **Crea un proyecto en Firebase Console**:
   - Ve a [Firebase Console](https://console.firebase.google.com/)
   - Crea un nuevo proyecto
   - Habilita Authentication > Email/Password

2. **Configura Android**:
   - En Firebase Console, ve a Project Settings > General
   - Agrega una app Android
   - Descarga `google-services.json`
   - Colócalo en `android/app/`
   
3. **Configura iOS**:
   - En Firebase Console, agrega una app iOS
   - Descarga `GoogleService-Info.plist`
   - Colócalo en `ios/Runner/`

4. **Crea `lib/firebase_options.dart`**:
   - Copia `lib/firebase_options.dart.example` a `lib/firebase_options.dart`
   - Reemplaza los valores con tus credenciales de Firebase Console

### Archivos de Configuración (No se suben a Git)

Los siguientes archivos contienen credenciales sensibles y están en `.gitignore`:

- `/lib/firebase_options.dart`
- `/android/app/google-services.json`
- `/ios/Runner/GoogleService-Info.plist`

**Archivos de ejemplo disponibles** (para referencia):
- `lib/firebase_options.dart.example`
- `android/app/google-services.json.example`
- `ios/Runner/GoogleService-Info.plist.example`

## 🏃‍♂️ Ejecutar la Aplicación

1. **Instala las dependencias**:
   ```bash
   flutter pub get
   ```

2. **Verifica que tienes los dispositivos disponibles**:
   ```bash
   flutter devices
   ```

3. **Ejecuta la app**:
   ```bash
   # En un dispositivo específico
   flutter run -d <deviceId>
   
   # En Chrome (Web)
   flutter run -d chrome
   
   # En un emulador Android
   flutter emulators --launch <emulatorId>
   flutter run
   ```

## 📁 Estructura del Proyecto

```
lib/
├── main.dart                 # Punto de entrada, inicializa Firebase
├── firebase_options.dart     # Configuración de Firebase (NO en Git)
├── providers/
│   └── auth_provider.dart    # Providers de autenticación con Riverpod
├── router/
│   └── app_router.dart       # Configuración de rutas con GoRouter
├── screens/
│   ├── login_screen.dart     # Pantalla de inicio de sesión
│   └── signup_screen.dart    # Pantalla de registro
└── services/
    └── auth_service.dart     # Servicio de autenticación de Firebase
```

## 🎨 Pantallas

### Login Screen
- Campos: Email, Contraseña
- Validación de formularios
- Toggle para mostrar/ocultar contraseña
- Link a pantalla de registro
- Manejo de errores

### Sign Up Screen
- Campos: Nombre completo, Email, Contraseña, Confirmar Contraseña
- Validación de formularios
- Toggle para mostrar/ocultar contraseñas
- Verificación de que las contraseñas coincidan
- Link a pantalla de login

## 🔐 Seguridad

- ✅ Archivos de configuración de Firebase ignorados en `.gitignore`
- ✅ Validación de formularios en el cliente
- ✅ Manejo de errores de Firebase Auth
- ✅ Mensajes de error en español

## 🛠️ Tecnologías Utilizadas

- **Flutter**: Framework de UI
- **Firebase Auth**: Autenticación de usuarios
- **Riverpod 3.0**: Gestión de estado
- **GoRouter 17.0**: Navegación declarativa
- **Material 3**: Diseño moderno

## 📝 Notas para Desarrolladores

1. **Nunca subas** los archivos de configuración de Firebase al repositorio
2. Si trabajas en equipo, cada desarrollador debe configurar su propio `firebase_options.dart`
3. Para producción, considera usar Firebase App Check para proteger tus APIs
4. Los mensajes de error están en español, ajusta según tu audiencia

## 🐛 Troubleshooting

### Error: "Target of URI doesn't exist: 'firebase_options.dart'"
- Asegúrate de haber ejecutado `flutterfire configure`
- O copia `firebase_options.dart.example` a `firebase_options.dart` y configúralo manualmente

### Error: "No Firebase App '[DEFAULT]' has been created"
- Verifica que `Firebase.initializeApp()` se llame en `main.dart`
- Asegúrate de que `firebase_options.dart` existe y tiene las credenciales correctas

### Error de autenticación
- Verifica que Email/Password está habilitado en Firebase Console > Authentication
- Revisa la configuración de dominios autorizados

## 📄 Licencia

Este proyecto es de código abierto y está disponible bajo la licencia MIT.

## 👥 Contribuir

Las contribuciones son bienvenidas. Por favor:
1. Haz un fork del proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📧 Contacto

Para preguntas o sugerencias, abre un issue en el repositorio.

