import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as encrypt;

String symmetricDecryptAES(String base64CipherText, String base64Key) {
  // Decode the base64-encoded inputs
  final keyBytes = utf8.encode(base64Key); // Convert base64 key to bytes
  final cipherTextBytes = base64Decode(base64CipherText);

  // Ensure the key length is compatible with AES (16, 24, 32 bytes)
  if (keyBytes.length != 16 && keyBytes.length != 24 && keyBytes.length != 32) {
    throw Exception('Invalid AES key length. Must be 16, 24, or 32 bytes.');
  }

  // Initialize the AES key
  final key = encrypt.Key(keyBytes);

  // Extract the nonce (first 12 bytes)
  final nonce = cipherTextBytes.sublist(0, 12);

  // Extract the ciphertext (remaining bytes)
  final ciphertext = cipherTextBytes.sublist(12);

  // Initialize the AES-GCM decrypter
  final encrypter = encrypt.Encrypter(
    encrypt.AES(key, mode: encrypt.AESMode.gcm),
  );

  // Decrypt the text
  final decryptedBytes = encrypter.decryptBytes(
    encrypt.Encrypted(Uint8List.fromList(ciphertext)),
    iv: encrypt.IV(nonce),
  );

  // Return the decrypted plaintext
  return utf8.decode(decryptedBytes);
}
