#!/usr/bin/env bash
echo "which folder you want to categorize?"
read foldername
echo "Add to categorized patient information to existing files[1] or creat newfiles[2]?"
read option
columns=$(echo "isMale,isBlack,isSmoker,isDiabetic,isHypertensive,Age,Systolic,Cholesterol,HDL,Risk")
if (("$option"=="2"))
then
    mkdir patient_by_risk
    echo $columns > ./patient_by_risk/low_risk.csv
    echo $columns >  ./patient_by_risk/medium_risk.csv
    echo $columns >  ./patient_by_risk/high_risk.csv
fi

cd files_for_analysis
for file in *
do
    tail -n +2 $file > tmp.csv
    while IFS="," read -r sex race smoke diabetes hypertension age sbp chol hdl risk
    do
        new=$(echo $risk | cut -d "." -f 1 | cut -d "," -f 1)
        if (( $new < 10 ))
        then
            echo "$sex,$race,$smoke,$diabetes,$hypertension,$age,$sbp,$chol,$hdl,$risk" >> ../patient_by_risk/low_risk.csv
        elif (( $new < 30))
        then
            echo "$sex,$race,$smoke,$diabetes,$hypertension,$age,$sbp,$chol,$hdl,$risk" >> ../patient_by_risk/medium_risk.csv
        else
            echo "$sex,$race,$smoke,$diabetes,$hypertension,$age,$sbp,$chol,$hdl,$risk" >> ../patient_by_risk/high_risk.csv
        fi
    done < tmp.csv
    rm tmp.csv
done
