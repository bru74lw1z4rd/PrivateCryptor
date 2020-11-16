#ifndef ENCRYPTIONPROCESS_H
#define ENCRYPTIONPROCESS_H

#include <QObject>

#include <QAEAD.h>
#include <QBlockCipher.h>

class EncryptionProcess : public QObject {
    Q_OBJECT

public:
    explicit EncryptionProcess(QObject* parent = nullptr);

    Q_INVOKABLE QString encryptDecryptTextWithBlockCipher(const bool isEncrypt, const int rounds,
        const QByteArray& data, const QByteArray& blockSizeType,
        const QByteArray& cipher, const QByteArray& hashCipher,
        const QByteArray& key, const QByteArray& iv,
        const QByteArray& salt, const QByteArray& password);

private:
    /* Block size */
    int processQmlAesBlockSize(const QString& aesBlockSizeType);

    const QString aes128BlockSizeType = "128";
    const QString aes192BlockSizeType = "192";
    const QString aes256BlockSizeType = "256";

    const int aes128PlaceInList = 0;
    const int aes192PlaceInList = 1;
    const int aes256PlaceInList = 2;

    /* Ciphers */
    const EVP_CIPHER* processQmlCipher(const int blockSizeType, const QString& cipherType);

    const QString aesEcbType = "AES - ECB";
    const QString aesCbcType = "AES - CBC";
    const QString aesCfbType = "AES - CFB";
    const QString aesOfbType = "AES - OFB";
    const QString aesCtrType = "AES - CTR";
    const QString aesCcmType = "AES - GCM";
    const QString aesGcmType = "AES - CCM";

    const QList<const EVP_CIPHER*> aesEcbCiphersList = { EVP_aes_128_ecb(), EVP_aes_192_ecb(), EVP_aes_256_ecb() };
    const QList<const EVP_CIPHER*> aesCbcCiphersList = { EVP_aes_128_cbc(), EVP_aes_192_cbc(), EVP_aes_256_cbc() };
    const QList<const EVP_CIPHER*> aesCfbCiphersList = { EVP_aes_128_cfb(), EVP_aes_192_cfb(), EVP_aes_256_cfb() };
    const QList<const EVP_CIPHER*> aesOfbCiphersList = { EVP_aes_128_ofb(), EVP_aes_192_ofb(), EVP_aes_256_ofb() };
    const QList<const EVP_CIPHER*> aesCtrCiphersList = { EVP_aes_128_ctr(), EVP_aes_192_ctr(), EVP_aes_256_ctr() };
    const QList<const EVP_CIPHER*> aesCcmCiphersList = { EVP_aes_128_ccm(), EVP_aes_192_ccm(), EVP_aes_256_ccm() };
    const QList<const EVP_CIPHER*> aesGcmCiphersList = { EVP_aes_128_gcm(), EVP_aes_192_gcm(), EVP_aes_256_gcm() };

    /* SHA */
    const EVP_MD* processQmlMD(const QString& mdType);

    const QString sha254Type = "SHA-254";
    const QString sha256Type = "SHA-256";
    const QString sha384Type = "SHA-384";
    const QString sha512Type = "SHA-512";
    const QString sha3_224Type = "SHA-3-224";
    const QString sha3_256Type = "SHA-3-256";
    const QString sha3_384Type = "SHA-3-384";
    const QString sha3_512Type = "SHA-3-512";
};

#endif // ENCRYPTIONPROCESS_H
