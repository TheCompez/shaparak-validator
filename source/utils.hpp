// Copyright (C) 2023 Kambiz Asadzadeh
// SPDX-License-Identifier: MIT

#ifndef UTILS_HPP
#define UTILS_HPP

#include "common.hpp"
#include <QObject>

#define HTTP "http://"
#define HTTPS "https://"

namespace Shaparak {

class Utils : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString url READ url WRITE setUrl NOTIFY urlChanged)
    Q_PROPERTY(QString getway READ getway WRITE setGetway NOTIFY getwayChanged)
    Q_PROPERTY(bool protocolValid READ protocolValid WRITE setProtocolValid NOTIFY protocolValidChanged)
    Q_PROPERTY(bool getwayValid READ getwayValid WRITE setGetwayValid NOTIFY getwayValidChanged)
    Q_PROPERTY(bool isSecured READ isSecured WRITE setIsSecured NOTIFY isSecuredChanged)
public:
    explicit Utils(QObject *parent = 0);

    void setUrl(const QString& url);
    void setGetway(const QString& getway);
    void setUrlValid(const bool urlValid);
    void setProtocolValid(const bool protocolValid);
    void setGetwayValid(const bool getwayValid);
    void setIsSecured(const bool isSecured);

    QString url() const;
    QString getway() const;
    bool urlValid() const;
    bool protocolValid() const;
    bool getwayValid() const;
    bool isSecured() const;

signals:
    void urlChanged();
    void getwayChanged();
    void urlValidChanged();
    void protocolValidChanged();
    void getwayValidChanged();
    void isSecuredChanged();

private:
    QString   m_url{};
    QString   m_getway{};
    bool      m_urlValid{};
    bool      m_protocolValid{};
    bool      m_getwayValidalid{};
    bool      m_isSecured{false};
};

}

#endif // UTILS_HPP
