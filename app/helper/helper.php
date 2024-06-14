<?php

function rupiah ($number){
    if(is_array($number)) return null;
    if(!$number) return null;

    if (strlen(round($number)) === strlen($number))
		return number_format($number, 0, ",", ".");

    return number_format($number, 2, ",", ".");
}

