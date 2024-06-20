<?php

function rupiah1($number)
{
  if (is_array($number)) return null;
  if (!$number) return null;

  if (strlen(round($number)) === strlen($number))
    return number_format($number, 0, ",", ".");

  return number_format($number, 2, ",", ".");
}

function rupiah($number)
{
  if ($number > 1000000000000)
    return rupiah1(round($number / 1000000000000)) . ' T';
  if ($number > 1000000000)
    return rupiah1(round($number / 1000000000)) . ' M';
  if ($number > 1000000000000)
    return rupiah1(round($number / 1000000)) . ' Jt';

  return rupiah1($number);
}
