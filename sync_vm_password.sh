#!/bin/bash

# 1. إنشاء كلمة مرور عشوائية جديدة وتخزينها
new_password=$(openssl rand -base64 12)

# 2. تحديث كلمة المرور في الجهاز الافتراضي باستخدام أمر `az`
az vm user update --resource-group VLAB_group --name VLAB --username azureuser --password "$new_password"

# 3. تخزين كلمة المرور في ملف نصي
echo "$new_password" > /root/vm_password.txt

# 4. عرض الرسالة لتأكيد التحديث
echo "Password has been updated and stored successfully."
