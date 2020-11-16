#include <QCoreApplication>
#include <iostream>

#include <QBlockCipher.h>

#include <QFile>
#include <QTextCodec>

//QByteArray newEncoding(const QByteArray& array)
//{
//    QByteArray newByteArray;

//    return newByteArray;
//}

int main(int argc, char* argv[])
{
    QCoreApplication a(argc, argv);

    QSimpleCrypto::QBlockCipher blockCipher;

    QByteArray key = "01234567890123456789012345678901";
    QByteArray iv = "0123456789012345";
    QByteArray salt = "abcdefgh" /*blockCipher.generateRandomBytes(8)*/;

    QByteArray encrypted = blockCipher.encryptAesBlockCipher("Hello World!", key, iv, "password", salt, 14, EVP_aes_256_cbc(), EVP_sha3_512());
    qDebug() << encrypted;

    //    QFile file("cryptedinfo");
    //    if (file.open(QIODevice::ReadWrite)) {
    //        //        QTextStream stream(&file);
    //        //        stream << encrypted;
    //        int fileHandle = file.handle();

    //    } else {
    //        qDebug() << file.errorString();
    //    }

    //    FILE* fh = fopen("cryptedinfo.txt", "rb");

    printf("\nCiphertext is:\n");
    BIO_dump_fp(stderr, encrypted.constData(), encrypted.size());

    qDebug() << "\n\n";

    QByteArray newArray[] = { "\xf7", "\x79", "\x59", "\x1e", "\x8e", "\x58", "\x7b", "\x82", "\x60", "\x11", "\x31", "\x2a", "\x2f", "\x68", "\x4c", "\x2a" };

    for (int i = 0; i < encrypted.size(); i++) {
        QString str = QString::number(encrypted.at(i));

        int nValue = str.toInt();
        QString result = QString::number(nValue, 16);
        qDebug() << str << " | " << result.toUpper().toLocal8Bit() << " | " << result.toLocal8Bit().toHex() << " | " << result.toLatin1();

        //        newArray.append("\\x" + result.toLocal8Bit().toUpper());
        //        qDebug() << QString("\\x" + QString::number(str.toInt(), 16).toUpper());
    }

    QByteArray test;
    for (int i = 0; i < 16; i++) {
        qDebug() << newArray[i];
        test.append(newArray[i]);
    }

    //    qDebug() << newArray;

    //    QTextCodec* codec = QTextCodec::codecForName("UTF-8");
    //    QString smile = QTextDecoder(codec).toUnicode(newArray, newArray.length());
    //    qDebug() << smile.toUtf8();

    //    fclose(fh);

    //    QByteArray mustBeDecrypted;

    //    QTextStream stream(&file);
    //    stream >> mustBeDecrypted;

    //    qDebug() << mustBeDecrypted;

    //    // \xF7yY\x1E\x8EX{\x82'\x111*/hL*

    //    \xF7yY\x1E\x8EX{\x82`\x11""1*/hL*
    //    \xF7yY\x1E\x8EX{\x82`\x11""1*/hL*

    qDebug() << "\xF7yY\x1E\x8EX{\x82'\"x11\"\"1*/hL*";
    QByteArray decrypted = blockCipher.decryptAesBlockCipher("\xF7yY\x1E\x8EX{\x82'\"x11\"\"1*/hL*", key, iv, "password", salt, 14, EVP_aes_256_cbc(), EVP_sha3_512());
    qDebug() << decrypted;

    return a.exec();
}
