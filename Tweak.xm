#import <UIKit/UIKit.h>
#import <substrate.h>

// تعريف القيم التي سنعدلها في نسخة 4.2
// ملاحظة: هذه الأوفستات كمثال، ستحتاج لتحديثها دائماً
#define kRecoilOffset 0x104A2B3C0 

// كود تفعيل القائمة عند فتح اللعبة
%ctor {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Asd Mod Menu" 
                                   message:@"تم التفعيل لنسخة 4.2" 
                                   preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"موافق" style:UIAlertActionStyleDefault handler:nil]];
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    });
}

// كود تعديل الارتداد (No Recoil)
void (*old_recoil)(void *instance);
void new_recoil(void *instance) {
    // هنا نجعل الارتداد صفر
    return; 
}


// --- تحديث العناوين لنسخة 4.2 (Global) ---

// 1. ثبات السلاح المطور (No Recoil)
// ملاحظة: في 4.2 غالباً ما يتغير العنوان بزيادة بسيطة
#define Offset_Recoil_42 0x02E9BB70 
#define Byte_Recoil_42 0xD65F03C0

// 2. ايم بوت (Aimbot Fix)
#define Offset_Aimbot_42 0x02A38F20

// 3. كشف أماكن/لون أبيض (White Color)
#define Offset_White_42 0x06237150
#define Byte_White_42 0x0849B85228593AB8

// --- برمجة الوظائف ---

void applyHacks() {
    // تفعيل ثبات السلاح 4.2
    MSHookMemory((void *)((long)0x100000000 + Offset_Recoil_42), &Byte_Recoil_42, 4);
    
    // تفعيل اللون الأبيض
    MSHookMemory((void *)((long)0x100000000 + Offset_White_42), &Byte_White_42, 8);
}

%ctor {
    // رسالة تنبيه عند الدخول للعبة
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        applyHacks();
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Gemini Mod 4.2" 
                                   message:@"تم تحديث الأكواد للإصدار الجديد 4.2 بنجاح ✅" 
                                   preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"استمرار" style:UIAlertActionStyleDefault handler:nil]];
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    });
}


