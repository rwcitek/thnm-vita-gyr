
# https://www.aamva.org/getmedia/99ac7057-0f4d-4461-b0a2-3a5532e1b35c/AAMVA-2020-DLID-Card-Design-Standard.pdf

cat dl.scan.txt |
sed -rne 's/^(D..)/\1: /p' |
sed -re '
/^(DBD|DBA|DDB|DBB)/s/([0-9]{2})([0-9]{2})([0-9]{4})/\1-\2-\3/;
s/^DAC/First Name/;
s/^DAD/Middle Name/;
s/^DCS/Last Name/;
s/^DBB/Date of Birth/;
s/^DAG/Address/;
s/^DAJ/State/;
s/^DAI/City/;
/^DCK/s/([0-9]{3})/\1-/g;
s/^DCK/ID/;
s/^DBD/Issue Date/;
s/^DBA/Expiration Date/;
s/^DAU/Height/;
/^DAY/s/GRN/Green/;
s/^DAY/Eye Color/;
/^DAW/s/$/ lbs/;
s/^DAW/Weight/;
/^DAK/s/([0-9]{5})([0-9]{4})/\1-\2/;
s/^DAK/Zip+4/;
s/^DCB/Restrictions/;
s/^DCA/Class/;
s/^DCD/Endorsements/;
/^DDK/s/1/Yes/;
s/^DDK/Organ Donor/;
/DDA/s/F/Compliant/;
s/^DDA/Compliance/;
s/^DDB/Revision/;
s/^DCG/Country/;
/^DBC/s/1/Male/;
/^DBC/s/2/Female/;
/^DBC/s/9/not specified/;
s/^DBC/Sex/;
s/: +.*$/\L&/;
s/( (nm|nw|ne|sw|se|usa))$/\U\1/;
s/\b./\u&/g;
;' |
sed -e 's/: */:\t/' |
column -s$'\t' -t -R1

