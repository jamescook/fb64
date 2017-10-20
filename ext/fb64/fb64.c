#include <stdlib.h>
#include <libbase64.h>
#include <ruby.h>
#include <ruby/encoding.h>

static VALUE m_FB64;
static VALUE e_DecodeError;

static VALUE
fb64_encode64(int argc, VALUE* argv, VALUE self)
{
  VALUE input;
  rb_scan_args(argc, argv, "1", &input);

  if (TYPE(input) != T_STRING) {
    rb_raise(rb_eTypeError, "expected a String");
  }

  const char* src = StringValueCStr(input);
  size_t srclen = RSTRING_LEN( (VALUE)input);
  size_t outlen = ((srclen * 4) / 3) + 1;
  char out[outlen];

  base64_encode(src, srclen, out, &outlen, 0);

  return rb_utf8_str_new(out, outlen);
}

static VALUE
fb64_decode64(int argc, VALUE *argv, VALUE self)
{
  VALUE input;
  rb_scan_args(argc, argv, "1", &input);

  if (TYPE(input) != T_STRING) {
    rb_raise(rb_eTypeError, "expected a String");
  }

  const char* src = StringValueCStr(input);
  size_t srclen = RSTRING_LEN( (VALUE)input);
  size_t outlen = ((srclen * 3) / 4) + 1;
  char out[outlen];

  int result;
  result = base64_decode(src, srclen, out, &outlen, 0);
  if (result != 1) {
    rb_raise(e_DecodeError, "Error during decode");
  }
  return rb_utf8_str_new(out, outlen);
}


void
Init_fb64() {
  m_FB64 = rb_define_module("FB64");
    
  e_DecodeError = rb_define_class_under(m_FB64, "DecodeError", rb_eStandardError);
  rb_define_module_function(m_FB64, "encode64", fb64_encode64, -1);
  rb_define_module_function(m_FB64, "decode64", fb64_decode64, -1);
}
