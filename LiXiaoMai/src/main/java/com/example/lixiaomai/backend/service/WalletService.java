package com.example.lixiaomai.backend.service;

import com.example.lixiaomai.backend.dao.WalletDao;
import com.example.lixiaomai.backend.entity.Wallet;

public class WalletService {
    static WalletDao walletDAO = new WalletDao();

    public Wallet getAllInfoOfWalletById(int id){
        return walletDAO.getAllInfoOfWalletById(id);
    }

    public boolean addWallet(Wallet wallet){
        return walletDAO.addWallet(wallet);
    }

    public boolean delWalletById(int id){
        return walletDAO.delWalletById(id);
    }

    public boolean updatePasswordById(int id,String newPassword){
        return walletDAO.updatePasswordById(id, newPassword);
    }

    public boolean updateBalanceById(int id, double newBalance){
        return walletDAO.updateBalanceById(id, newBalance);
    }
}
