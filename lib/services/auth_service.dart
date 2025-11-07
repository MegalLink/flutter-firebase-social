import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Stream del estado de autenticación
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Usuario actual
  User? get currentUser => _auth.currentUser;

  // Registro con email y contraseña
  Future<AuthResult> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      // Actualizar el nombre de usuario
      await userCredential.user?.updateDisplayName(displayName.trim());
      await userCredential.user?.reload();

      return AuthResult(
        success: true,
        user: _auth.currentUser,
        message: 'Cuenta creada exitosamente',
      );
    } on FirebaseAuthException catch (e) {
      return AuthResult(
        success: false,
        message: _getErrorMessage(e.code),
      );
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'Error desconocido: ${e.toString()}',
      );
    }
  }

  // Login con email y contraseña
  Future<AuthResult> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      return AuthResult(
        success: true,
        user: userCredential.user,
        message: 'Inicio de sesión exitoso',
      );
    } on FirebaseAuthException catch (e) {
      return AuthResult(
        success: false,
        message: _getErrorMessage(e.code),
      );
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'Error desconocido: ${e.toString()}',
      );
    }
  }

  // Cerrar sesión
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Restablecer contraseña
  Future<AuthResult> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      return AuthResult(
        success: true,
        message: 'Correo de recuperación enviado',
      );
    } on FirebaseAuthException catch (e) {
      return AuthResult(
        success: false,
        message: _getErrorMessage(e.code),
      );
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'Error desconocido: ${e.toString()}',
      );
    }
  }

  // Eliminar cuenta
  Future<AuthResult> deleteAccount() async {
    try {
      await _auth.currentUser?.delete();
      return AuthResult(
        success: true,
        message: 'Cuenta eliminada exitosamente',
      );
    } on FirebaseAuthException catch (e) {
      return AuthResult(
        success: false,
        message: _getErrorMessage(e.code),
      );
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'Error desconocido: ${e.toString()}',
      );
    }
  }

  // Mensajes de error en español
  String _getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'weak-password':
        return 'La contraseña es demasiado débil. Usa al menos 6 caracteres.';
      case 'email-already-in-use':
        return 'Este correo ya está registrado. Intenta iniciar sesión.';
      case 'invalid-email':
        return 'El correo electrónico no es válido.';
      case 'operation-not-allowed':
        return 'Operación no permitida. Contacta al administrador.';
      case 'user-disabled':
        return 'Esta cuenta ha sido deshabilitada.';
      case 'user-not-found':
        return 'No existe una cuenta con este correo.';
      case 'wrong-password':
        return 'Contraseña incorrecta.';
      case 'invalid-credential':
        return 'Las credenciales son inválidas o han expirado.';
      case 'too-many-requests':
        return 'Demasiados intentos. Intenta de nuevo más tarde.';
      case 'network-request-failed':
        return 'Error de conexión. Verifica tu internet.';
      case 'requires-recent-login':
        return 'Debes iniciar sesión de nuevo para realizar esta acción.';
      default:
        return 'Error: $errorCode';
    }
  }
}

// Clase para resultados de autenticación
class AuthResult {
  final bool success;
  final User? user;
  final String message;

  AuthResult({
    required this.success,
    this.user,
    required this.message,
  });
}
