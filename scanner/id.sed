
# https://www.aamva.org/getmedia/99ac7057-0f4d-4461-b0a2-3a5532e1b35c/AAMVA-2020-DLID-Card-Design-Standard.pdf

cat dl.scan.txt |
sed -rne 's/^(D..)/\1: /p' |
sed -re '
s/^DAC/First Name/;
s/^DAD/Middle name/;
s/^DCS/Last name/;
/^DBB/s/([0-9]{2})([0-9]{2})([0-9]{4})/\1-\2-\3/;
s/^DBB/Date of Birth/;
s/^DAG/Address/;
s/^DAJ/State/;
s/^DAI/City/;
s/^DCK/ID/;
/^DBD/s/([0-9]{2})([0-9]{2})([0-9]{4})/\1-\2-\3/;
s/^DBD/Issue Date/;
/^DBA/s/([0-9]{2})([0-9]{2})([0-9]{4})/\1-\2-\3/;
s/^DBA/Expiration Date/;
s/^DAU/Height/;
/^DAY/s/GRN/Green/;
s/^DAY/Eye Color/;
/^DAW/s/([0-9]+)/\1 lbs/;
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
/^DDB/s/([0-9]{2})([0-9]{2})([0-9]{4})/\1-\2-\3/;
s/^DDB/Revision/;
s/^DCG/Country/;
/^DBC/s/1/Male/;
/^DBC/s/2/Female/;
/^DBC/s/9/not specified/;
s/^DBC/Sex/' |
sed -e 's/: */:\t/' |
column -s$'\t' -t -R1

