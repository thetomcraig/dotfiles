#!/usr/bin/env bash

CWD="${1}"

if [ "$CWD" = "airflow" ]; then
  echo "✈️"
elif [ "$CWD" = "ceres" ]; then
  echo "🍃"
elif [ "$CWD" = "CeresNotes" ]; then
  echo "🕋"
elif [ "$CWD" = "Notes" ]; then
  echo "📝"
elif [ "$CWD" = "TomCraig" ]; then
  echo "📝"
elif [ "$CWD" = "ceres_works" ]; then
  echo "🛠"
elif [ "$CWD" = "osiris" ]; then
  echo "☠️"
elif [ "$CWD" = "avian" ]; then
  echo "🗺"
elif [ "$CWD" = "image-tiler" ]; then
  echo "🖼"
elif [ "$CWD" = "hermes" ]; then
  echo "🗣"
else
  echo "$CWD"
fi
