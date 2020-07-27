// Copyright (c) 2011-2018 The Placeholders Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef PLACEH_QT_UTILITYDIALOG_H
#define PLACEH_QT_UTILITYDIALOG_H

#include <QDialog>
#include <QObject>

class PlaceholdersGUI;

namespace interfaces {
    class Node;
}

namespace Ui {
    class HelpMessageDialog;
}

/** "Help message" dialog box */
class HelpMessageDialog : public QDialog
{
    Q_OBJECT

public:
    explicit HelpMessageDialog(interfaces::Node& node, QWidget *parent, bool about);
    ~HelpMessageDialog();

    void printToConsole();
    void showOrPrint();

private:
    Ui::HelpMessageDialog *ui;
    QString text;

private Q_SLOTS:
    void on_okButton_accepted();
};


/** "Shutdown" window */
class ShutdownWindow : public QWidget
{
    Q_OBJECT

public:
    explicit ShutdownWindow(QWidget *parent=nullptr, Qt::WindowFlags f=Qt::Widget);
    static QWidget *showShutdownWindow(PlaceholdersGUI *window);

protected:
    void closeEvent(QCloseEvent *event);
};

#endif // PLACEH_QT_UTILITYDIALOG_H
