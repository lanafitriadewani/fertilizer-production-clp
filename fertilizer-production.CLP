(defrule Ammonium-Sulfate-Low-pH
  (chemical NH4) ; Ammonium
  (pH-level low)
  (reaction-type acid-base)
  (dilution-needed yes)
  =>
  (printout t crlf "Add 100g of Ammonium Sulfate" crlf))

(defrule Ammonium-Sulfate-Medium-pH
  (chemical NH4) ; Ammonium
  (pH-level medium)
  (reaction-type acid-base)
  (dilution-needed yes)
  =>
  (printout t crlf "Add 50g of Ammonium Sulfate" crlf))

(defrule Potassium-Hydroxide-Low-pH
  (chemical KOH) ; Potassium Hydroxide
  (pH-level low)
  (reaction-type acid-base)
  (dilution-needed yes)
  =>
  (printout t crlf "Add 200ml of Potassium Hydroxide" crlf))

(defrule Potassium-Hydroxide-Medium-pH
  (chemical KOH) ; Potassium Hydroxide
  (pH-level medium)
  (reaction-type acid-base)
  (dilution-needed yes)
  =>
  (printout t crlf "Add 150ml of Potassium Hydroxide" crlf))

(defrule Urea-Hot-Temperature
  (chemical CO(NH2)2) ; Urea
  (temperature hot)
  (reaction-type solvent)
  (dilution-needed no)
  =>
  (printout t crlf "Add 500ml of Urea" crlf))

(defrule Urea-Warm-Temperature
  (chemical CO(NH2)2) ; Urea
  (temperature warm)
  (reaction-type solvent)
  (dilution-needed no)
  =>
  (printout t crlf "Add 300ml of Urea" crlf))

(defrule Ammonia-High-Pressure
  (chemical NH3)
  (pressure high)
  (reaction-type gas-liquid)
  (dilution-needed yes)
  =>
  (printout t crlf "Add 2kg of Ammonia" crlf))

(defrule Ammonia-Medium-Pressure
  (chemical NH3)
  (pressure medium)
  (reaction-type gas-liquid)
  (dilution-needed yes)
  =>
  (printout t crlf "Add 1kg of Ammonia" crlf))

(defrule Platinum-Hot-Temperature
  (chemical Pt)
  (temperature hot)
  (reaction-type catalyst)
  (dilution-needed no)
  =>
  (printout t crlf "Add 10g of Platinum" crlf))

(defrule Platinum-Warm-Temperature
  (chemical Pt)
  (temperature warm)
  (reaction-type catalyst)
  (dilution-needed no)
  =>
  (printout t crlf "Add 5g of Platinum" crlf))

(defrule Other-Chemical-Recommendation
  (chemical ?chem)
  =>
  (if (eq ?chem Sulfur)
      then (printout t crlf "Add 200g of Sulfur" crlf)
      else
      (if (eq ?chem Magnesium)
          then (printout t crlf "Add 10g of Magnesium" crlf)
          else (printout t crlf "No specific recommendation for this chemical" crlf))))

(defrule input
   (initial-fact)
   =>
   (printout t crlf "What is the required chemical? (NH4, KOH, CO(NH2)2, NH3, Pt, Sulfur, Magnesium) ")
   (bind ?chemical (read))
   (assert (chemical ?chemical))
   (printout t crlf "What is the pH level? (low, medium) ")
   (bind ?pH (read))
   (assert (pH-level ?pH))
   (printout t crlf "What is the temperature? (hot, warm) ")
   (bind ?temperature (read))
   (assert (temperature ?temperature))
   (printout t crlf "What is the pressure? (high, medium) ")
   (bind ?pressure (read))
   (assert (pressure ?pressure))
   (printout t crlf "What is the type of chemical reaction? (acid-base, solvent, gas-liquid, catalyst) ")
   (bind ?reaction (read))
   (assert (reaction-type ?reaction))
   (printout t crlf "Is dilution needed? (yes/no) ")
   (bind ?dilution (read))
   (assert (dilution-needed ?dilution))
   (printout t crlf "RECOMMENDATIONS:" crlf))
 