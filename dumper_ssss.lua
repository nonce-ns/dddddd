-- Dumper for AnityX Loader
-- Cara Pakai:
-- 1. Masukkan Key yang valid (pinjam teman atau beli sekali) ke variable 'ValidKey'.
-- 2. Jalankan script ini.
-- 3. Script asli akan disimpan ke file 'DumpedScript.lua' (jika executor support writefile) atau di-copy ke clipboard.

getgenv().script_key = "FREE-783D88DB57C276F677438F0F" -- Key dari user

local v1 = game:GetService("Players");
local v4 = string.format;
local v5 = tostring;
local v6 = game.HttpGet;

local _0x1 = "https://anityx-server.onrender.com";
local _0x2 = "/loader?key=";
local _0x3 = "&hwid=";
local _ID = "&id=default";

local function DumpScript(k)
    local p = v1.LocalPlayer;
    local u = v5(p.UserId);
    
    warn("Mencoba mengambil script dari server...")
    
    local _url = v4("%s%s%s%s%s%s", _0x1, _0x2, k, _0x3, u, _ID);
    
    local s, r = pcall(function()
        return v6(game, _url);
    end);

    if s and r then
        if string.find(r, "Error") or string.find(r, "Forbidden") or #r < 50 then
            warn(":: GAGAL :: Server menolak key atau key salah.")
            warn("Response Server: " .. tostring(r))
        else
            print(":: BERHASIL! Script didapatkan! ::")
            warn("Panjang Script: " .. #r .. " karakter")
            
            -- Coba simpan ke file
            pcall(function()
                writefile("Dumped_AnityX.lua", r)
                print("Script tersimpan di: workspace/Dumped_AnityX.lua")
            end)
            
            -- Coba copy ke clipboard
            pcall(function()
                setclipboard(r)
                print("Script telah dicopy ke Clipboard!")
            end)
            
            print("---------------------------------------------------")
            print("Sekarang Anda bisa pakai script di 'Dumped_AnityX.lua' tanpa key selamanya!")
            print("---------------------------------------------------")
        end
    else
        warn(":: Error Koneksi :: Gagal menghubungi server.")
    end
end

DumpScript(getgenv().script_key)
