@echo off

if "%~1"=="" exit \b 1
set "gamepath=%~1"

if not exist "%gamepath%\gamehf2\lsao_cached.pak" exit \b 1

:: get XBS sound files from lsao_cached.pak (and put them into an archive)
jptch "%gamepath%\gamehf2\lsao_cached.pak" xbs_extract.patch xbs_extracted.tar

if not exist xbs_extracted.tar exit \b 1

:: extract the archive we just made
7za x -aoa xbs_extracted.tar

if not exist xbs\electrogun2_loop22_01.xbs exit \b 1

mkdir ts2\sfx

:: convert Xbox xbs files to PC-compatible wav audio files
xbadpdec -o 0x20 -f 22050 -c 1 xbs\electrogun2_loop22_01.xbs ts2\sfx\electrogun2_loop22_01.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun14_me_22.xbs ts2\sfx\gun14_me_22.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun71b_withbullet22_01.xbs ts2\sfx\gun71b_withbullet22_01.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun71c_22.xbs ts2\sfx\gun71c_22.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_assault_rifle_withbullet22_01.xbs ts2\sfx\gun_assault_rifle_withbullet22_01.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_cock03b_22.xbs ts2\sfx\gun_cock03b_22.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_console_on22_05.xbs ts2\sfx\gun_console_on22_05.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_dr08c_22.xbs ts2\sfx\gun_dr08c_22.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_dryfire01_22.xbs ts2\sfx\gun_dryfire01_22.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_electro_charge22_01.xbs ts2\sfx\gun_electro_charge22_01.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_electrogun22_01.xbs ts2\sfx\gun_electrogun22_01.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_fire_extin22_04.xbs ts2\sfx\gun_fire_extin22_04.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_fire_extin_loop22_03.xbs ts2\sfx\gun_fire_extin_loop22_03.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_fire_extin_loop22_03b.xbs ts2\sfx\gun_fire_extin_loop22_03b.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_fixedgun22_07e.xbs ts2\sfx\gun_fixedgun22_07e.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_flamethrower22_02.xbs ts2\sfx\gun_flamethrower22_02.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_flamethrower_loop22_02b.xbs ts2\sfx\gun_flamethrower_loop22_02b.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_grenade_launcher01c_22.xbs ts2\sfx\gun_grenade_launcher01c_22.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_grenade_new22_01b.xbs ts2\sfx\gun_grenade_new22_01b.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_grenade_new22_02.xbs ts2\sfx\gun_grenade_new22_02.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_handgun_scifi_22.xbs ts2\sfx\gun_handgun_scifi_22.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_hybrid06_me_22.xbs ts2\sfx\gun_hybrid06_me_22.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_hybrid_rocket01b_22.xbs ts2\sfx\gun_hybrid_rocket01b_22.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_laser01b_me_22.xbs ts2\sfx\gun_laser01b_me_22.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_laser02_me_22.xbs ts2\sfx\gun_laser02_me_22.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_laser3way22_06b.xbs ts2\sfx\gun_laser3way22_06b.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_m16_04_withbullet22.xbs ts2\sfx\gun_m16_04_withbullet22.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_mauser_withbullet22_01.xbs ts2\sfx\gun_mauser_withbullet22_01.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_mini_withbullet22_02.xbs ts2\sfx\gun_mini_withbullet22_02.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_plasma_overheat22_01.xbs ts2\sfx\gun_plasma_overheat22_01.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_policecar22_03.xbs ts2\sfx\gun_policecar22_03.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_railbot_laser22_03.xbs ts2\sfx\gun_railbot_laser22_03.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_redlaser22_03.xbs ts2\sfx\gun_redlaser22_03.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_rocketlauncher22.xbs ts2\sfx\gun_rocketlauncher22.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_silenced22.xbs ts2\sfx\gun_silenced22.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_sniper_rifle22_01d.xbs ts2\sfx\gun_sniper_rifle22_01d.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_tommygun_withbullet22_02.xbs ts2\sfx\gun_tommygun_withbullet22_02.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_uzi_withbullet22_01d.xbs ts2\sfx\gun_uzi_withbullet22_01d.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_walther_and_bullet22_01e.xbs ts2\sfx\gun_walther_and_bullet22_01e.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_walther_colt22_02.xbs ts2\sfx\gun_walther_colt22_02.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gun_walther_colt22_03.xbs ts2\sfx\gun_walther_colt22_03.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gunpowder_pour22_02a.xbs ts2\sfx\gunpowder_pour22_02a.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gunpowder_pour22_02b.xbs ts2\sfx\gunpowder_pour22_02b.wav
xbadpdec -o 0x20 -f 22050 -c 1 xbs\gunrespawn22_02.xbs ts2\sfx\gunrespawn22_02.wav
xbadpdec -o 0x20 -f 44100 -c 1 xbs\gun_scifi_sniper44_01.xbs ts2\sfx\gun_scifi_sniper44_01.wav
xbadpdec -o 0x20 -f 44100 -c 1 xbs\gun_sniperrifle_nu44_03b.xbs ts2\sfx\gun_sniperrifle_nu44_03b.wav

:: create a copy of each sound effect for the first-person view
copy ts2\sfx\electrogun2_loop22_01.wav ts2\sfx\electrogun2_loop22_01_fp.wav
copy ts2\sfx\gun71c_22.wav ts2\sfx\gun71c_22_fp.wav
copy ts2\sfx\gun_console_on22_05.wav ts2\sfx\gun_console_on22_05_fp.wav
copy ts2\sfx\gun_dr08c_22.wav ts2\sfx\gun_dr08c_22_fp.wav
copy ts2\sfx\gun_grenade_new22_01b.wav ts2\sfx\gun_grenade_new22_01b_fp.wav
copy ts2\sfx\gun_hybrid_rocket01b_22.wav ts2\sfx\gun_hybrid_rocket01b_22_fp.wav
copy ts2\sfx\gun_m16_04_withbullet22.wav ts2\sfx\gun_m16_04_withbullet22_fp.wav
copy ts2\sfx\gun_redlaser22_03.wav ts2\sfx\gun_redlaser22_03_fp.wav
copy ts2\sfx\gun_rocketlauncher22.wav ts2\sfx\gun_rocketlauncher22_fp.wav
copy ts2\sfx\gun_sniper_rifle22_01d.wav ts2\sfx\gun_sniper_rifle22_01d_fp.wav
copy ts2\sfx\gun_sniperrifle_nu44_03b.wav ts2\sfx\gun_sniperrifle_nu44_03b_fp.wav
copy ts2\sfx\gun_tommygun_withbullet22_02.wav ts2\sfx\gun_tommygun_withbullet22_02_fp.wav
copy ts2\sfx\gun_uzi_withbullet22_01d.wav ts2\sfx\gun_uzi_withbullet22_01d_fp.wav
copy ts2\sfx\gun_walther_and_bullet22_01e.wav ts2\sfx\gun_walther_and_bullet22_01e_fp.wav
copy ts2\sfx\gun_walther_colt22_02.wav ts2\sfx\gun_walther_colt22_02_fp.wav
copy ts2\sfx\gun_walther_colt22_03.wav ts2\sfx\gun_walther_colt22_03_fp.wav

7za a -tzip -r -mx0 "%gamepath%\gamehf2\ts2_guns_sfx.pak" "ts2"

exit \b 0