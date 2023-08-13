# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: kinesis-egress.proto
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor.FileDescriptor(
  name='kinesis-egress.proto',
  package='io.statefun.sdk.egress',
  syntax='proto3',
  serialized_options=b'\n.org.apache.flink.statefun.sdk.egress.generatedP\001Z\n.;protocol',
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n\x14kinesis-egress.proto\x12\x16io.statefun.sdk.egress\"l\n\x13KinesisEgressRecord\x12\x15\n\rpartition_key\x18\x01 \x01(\t\x12\x13\n\x0bvalue_bytes\x18\x02 \x01(\x0c\x12\x0e\n\x06stream\x18\x03 \x01(\t\x12\x19\n\x11\x65xplicit_hash_key\x18\x04 \x01(\tB>\n.org.apache.flink.statefun.sdk.egress.generatedP\x01Z\n.;protocolb\x06proto3'
)




_KINESISEGRESSRECORD = _descriptor.Descriptor(
  name='KinesisEgressRecord',
  full_name='io.statefun.sdk.egress.KinesisEgressRecord',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='partition_key', full_name='io.statefun.sdk.egress.KinesisEgressRecord.partition_key', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='value_bytes', full_name='io.statefun.sdk.egress.KinesisEgressRecord.value_bytes', index=1,
      number=2, type=12, cpp_type=9, label=1,
      has_default_value=False, default_value=b"",
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='stream', full_name='io.statefun.sdk.egress.KinesisEgressRecord.stream', index=2,
      number=3, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='explicit_hash_key', full_name='io.statefun.sdk.egress.KinesisEgressRecord.explicit_hash_key', index=3,
      number=4, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=48,
  serialized_end=156,
)

DESCRIPTOR.message_types_by_name['KinesisEgressRecord'] = _KINESISEGRESSRECORD
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

KinesisEgressRecord = _reflection.GeneratedProtocolMessageType('KinesisEgressRecord', (_message.Message,), {
  'DESCRIPTOR' : _KINESISEGRESSRECORD,
  '__module__' : 'kinesis_egress_pb2'
  # @@protoc_insertion_point(class_scope:io.statefun.sdk.egress.KinesisEgressRecord)
  })
_sym_db.RegisterMessage(KinesisEgressRecord)


DESCRIPTOR._options = None
# @@protoc_insertion_point(module_scope)
