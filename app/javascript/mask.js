import Inputmask from "inputmask";

const element_phone = document.getElementsByClassName("mask-phone");

const im_phone = new Inputmask("99 9 9999-9999");
im_phone.mask(element_phone);
