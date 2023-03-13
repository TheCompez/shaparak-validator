#include "utils.hpp"
#include <QRegularExpression>
#include <QGuiApplication>
#include <QClipboard>

using namespace Shaparak;

Utils::Utils(QObject *parent)
    : QObject(parent)
{
}

using Getways = QMap<QString, QString>;

void Utils::setUrl(const QString& url)
{
    QString link {url};

    url.startsWith(HTTPS) ? setProtocolValid(true) : setProtocolValid(false);

    link.startsWith(HTTPS) ? setIsSecured(true) : setIsSecured(false);

    if(url.startsWith("http:"))
    {
        setUrlValid(false);
    }
    if(url.startsWith("https:"))
    {
        setUrlValid(true);
    }

    const Getways list {
        {{"asan.shaparak.ir"},{"آسان پرداخت پرشین"}},
        {{"bpm.shaparak.ir"},{"به‌پرداخت ملت"}},
        {{"pec.shaparak.ir"},{"تجارت الکترونیک پارسیانآسان پرداخت پرشین"}},
        {{"pecco.shaparak.ir"},{"تجارت الکترونیک پارسیان"}},
        {{"sep.shaparak.ir"},{"تجارت الکترونیک پارسیان"}},
        {{"sep2.shaparak.ir"},{"پرداخت الکترونیک سامان"}},
        {{"pep.shaparak.ir"},{"پرداخت الکترونیک پاسارگاد"}},
        {{"pna.shaparak.ir"},{"پرداخت نوین آرین"}},
        {{"sadad.shaparak.ir"},{"پرداخت الکترونیک سداد"}},
        {{"ikc.shaparak.ir"},{"کارت اعتباری ایران کیش"}},
        {{"fanava.shaparak.ir"},{"فن آوا کارت"}},
        {{"fcp.shaparak.ir"},{"فن آوا کارت"}},
        {{"mabna.shaparak.ir"},{"پرداخت الکترونیک سپهر"}},
        {{"ecd.shaparak.ir"},{"الکترونیک کارت دماوند"}},
        {{"pas.shaparak.ir"},{"سایان کارت"}},
    };

    const static QRegularExpression re("^(http|https)://", QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match = re.match(link);
    qDebug() << link;
    if (match.hasMatch())
    {
        link.remove(re);
        if(link.endsWith("/"))
        {
            link.removeLast();
        }
    }
    if(list.contains(link))
    {
        m_getway = list.value(link);
        setGetwayValid(true);
    } else {
        m_getway = "";
        setGetwayValid(false);
    }

}

void Utils::setGetway(const QString& getway)
{
    m_getway = getway;
}

void Utils::setIsSecured(const bool isSecured)
{
    m_isSecured = isSecured;
}

void Utils::setUrlValid(const bool urlValid)
{
    m_urlValid = urlValid;
}

void Utils::setProtocolValid(const bool protocolValid)
{
    m_protocolValid = protocolValid;
}

void Utils::setGetwayValid(const bool getwayValid)
{
    m_getwayValidalid = getwayValid;
}

QString Utils::url() const
{
    return m_url;
}

QString Utils::getway() const
{
    return m_getway;
}

bool Utils::isSecured() const
{
    return m_isSecured;
}

bool Utils::urlValid() const
{
    return m_urlValid;
}

bool Utils::protocolValid() const
{
    return m_protocolValid;
}

bool Utils::getwayValid() const
{
    return m_getwayValidalid;
}
