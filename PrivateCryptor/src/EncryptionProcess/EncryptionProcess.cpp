#include "EncryptionProcess.h"

EncryptionProcess::EncryptionProcess(QObject* parent)
    : QObject(parent)
{
}

///
/// \brief EncryptionProcess::encryptDecryptFileWithBlockCipher
/// \param isEncrypt
/// \param rounds
/// \param currentFileName
/// \param newFileName
/// \param blockSizeType
/// \param cipher
/// \param hashCipher
/// \param key
/// \param iv
/// \param salt
/// \param password
/// \return
///
bool EncryptionProcess::encryptDecryptFileWithBlockCipher(const bool isEncrypt, const int rounds,
    QString currentFilePath, const QByteArray& blockSizeType,
    const QByteArray& cipher, const QByteArray& hashCipher,
    const QByteArray& key, const QByteArray& iv,
    const QByteArray& salt, const QByteArray& password)
{
    /* Read data from user file */
    QFile userFile(currentFilePath.remove("file://"));
    if (!userFile.open(QIODevice::ReadOnly)) {
        openMessageDialog("Couldn't read data from file!");
        return false;
    }

    /* Initialize data store */
    QByteArray data;
    data.reserve(userFile.size());
    data = userFile.readAll();

    if (isEncrypt) {
        /* Save encrypted file */
        QFile file(currentFilePath + ".pcrypto");
        if (file.open(QIODevice::ReadWrite)) {
            QSimpleCrypto::QBlockCipher blockCipher;
            if (0 >= file.write(blockCipher.encryptAesBlockCipher(data, key, iv, password, salt, rounds, processQmlCipher(processQmlAesBlockSize(blockSizeType), cipher), processQmlMD(hashCipher)).toBase64())) {
                openMessageDialog("Couldn't write encrypted data into file!");
                return false;
            }
        } else {
            openMessageDialog("Couldn't initialize encrypted file!");
            return false;
        }
    } else {
        /* Save decrypted file */
        QFile file(currentFilePath.remove(".pcrypto"));
        if (file.open(QIODevice::ReadWrite)) {
            QSimpleCrypto::QBlockCipher blockCipher;
            if (0 >= file.write(blockCipher.decryptAesBlockCipher(QByteArray::fromBase64(data), key, iv, password, salt, rounds, processQmlCipher(processQmlAesBlockSize(blockSizeType), cipher), processQmlMD(hashCipher)))) {
                openMessageDialog("Couldn't write encrypted data into file!");
                return false;
            }
        } else {
            openMessageDialog("Couldn't initialize decrypted file!");
            return false;
        }
    }

    return true;
}

///
/// \brief EncryptionProcess::encryptDecryptText
/// \param isEncrypt
/// \param rounds
/// \param data
/// \param blockSizeType
/// \param cipher
/// \param hashCipher
/// \param key
/// \param iv
/// \param salt
/// \param password
/// \return
///
QString EncryptionProcess::encryptDecryptTextWithBlockCipher(const bool isEncrypt, const int rounds,
    const QByteArray& data, const QByteArray& blockSizeType,
    const QByteArray& cipher, const QByteArray& hashCipher,
    const QByteArray& key, const QByteArray& iv,
    const QByteArray& salt, const QByteArray& password)
{
    QSimpleCrypto::QBlockCipher blockCipher;

    const int currentAesBlockSize = processQmlAesBlockSize(blockSizeType);

    if (isEncrypt) {
        return blockCipher.encryptAesBlockCipher(data, key, iv, password, salt, rounds, processQmlCipher(currentAesBlockSize, cipher), processQmlMD(hashCipher)).toBase64();
    } else {
        return blockCipher.decryptAesBlockCipher(QByteArray::fromBase64(data), key, iv, password, salt, rounds, processQmlCipher(currentAesBlockSize, cipher), processQmlMD(hashCipher));
    }

    return "";
}

///
/// \brief EncryptionProcess::processQmlAesBlockSize
/// \param aesBlockSizeType
/// \return
///
int EncryptionProcess::processQmlAesBlockSize(const QString& aesBlockSizeType)
{
    if (aesBlockSizeType == aes128BlockSizeType) {
        return aes128PlaceInList;
    } else if (aesBlockSizeType == aes192BlockSizeType) {
        return aes192PlaceInList;
    } else if (aesBlockSizeType == aes256BlockSizeType) {
        return aes256PlaceInList;
    }

    return -1;
}

///
/// \brief EncryptionProcess::processQmlValue
/// \param isCipher
/// \param blockSizeType
/// \param cipherType14
/// \return
///
const EVP_CIPHER* EncryptionProcess::processQmlCipher(const int blockSizeType, const QString& cipherType)
{
    if (cipherType == aesEcbType) {
        return aesEcbCiphersList.at(blockSizeType);
    } else if (cipherType == aesCbcType) {
        return aesCbcCiphersList.at(blockSizeType);
    } else if (cipherType == aesCfbType) {
        return aesCfbCiphersList.at(blockSizeType);
    } else if (cipherType == aesOfbType) {
        return aesOfbCiphersList.at(blockSizeType);
    } else if (cipherType == aesCtrType) {
        return aesCtrCiphersList.at(blockSizeType);
    }

    return nullptr;
}

///
/// \brief EncryptionProcess::processQmlMD
/// \param mdType
/// \return
///
const EVP_MD* EncryptionProcess::processQmlMD(const QString& mdType)
{
    if (mdType == sha254Type) {
        return EVP_sha224();
    } else if (mdType == sha256Type) {
        return EVP_sha256();
    } else if (mdType == sha384Type) {
        return EVP_sha384();
    } else if (mdType == sha512Type) {
        return EVP_sha512();
    } else if (mdType == sha3_224Type) {
        return EVP_sha3_224();
    } else if (mdType == sha3_256Type) {
        return EVP_sha3_256();
    } else if (mdType == sha3_384Type) {
        return EVP_sha3_384();
    } else if (mdType == sha3_512Type) {
        return EVP_sha3_512();
    }

    return nullptr;
}
