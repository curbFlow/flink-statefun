/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.google.protobuf;

import java.nio.ByteBuffer;

public class MoreByteStrings {

  private static final java.lang.reflect.Method wrapAllBytes;
  private static final java.lang.reflect.Method wrapBytes;
  private static final java.lang.reflect.Method wrapByteBuffer;

  static {
    try {
      final var classLoader = MoreByteStrings.class.getClassLoader();
      final var byteStringClass = classLoader.loadClass("com.google.protobuf.ByteString");
      wrapAllBytes = byteStringClass.getDeclaredMethod("wrap", byte[].class);
      wrapAllBytes.setAccessible(true);
      wrapBytes = byteStringClass.getDeclaredMethod("wrap", byte[].class, int.class, int.class);
      wrapBytes.setAccessible(true);
      wrapByteBuffer = byteStringClass.getDeclaredMethod("wrap", ByteBuffer.class);
      wrapByteBuffer.setAccessible(true);
    } catch (ReflectiveOperationException e) {
      throw new ExceptionInInitializerError(e);
    }
  }

  private static interface ReflectiveSupplier<T> {
    T get() throws ReflectiveOperationException;
  }

  private static <T> T safeInvoke(ReflectiveSupplier<T> supplier) {
    try {
      return supplier.get();
    } catch (ReflectiveOperationException e) {
      throw new RuntimeException(e);
    }
  }

  public static ByteString wrap(byte[] bytes) {
    return safeInvoke(() -> (ByteString) wrapAllBytes.invoke(null, (Object) bytes));
  }

  public static ByteString wrap(byte[] bytes, int offset, int len) {
    return safeInvoke(() -> (ByteString) wrapBytes.invoke(null, (Object) bytes, offset, len));
  }

  public static ByteString wrap(ByteBuffer buffer) {
    return safeInvoke(() -> (ByteString) wrapByteBuffer.invoke(null, buffer));
  }

  public static ByteString concat(ByteString first, ByteString second) {
    return first.concat(second);
  }
}
