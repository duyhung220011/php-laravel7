<?php

use Illuminate\Database\Seeder;

class SettingTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data=array(
            'description'=>"Cái gì cũng có, chỉ cần bạn có tiền",
            'short_des'=>"Không thiếu cái gì, chỉ cần bạn không thiếu tiền",
            'photo'=>"image.jpg",
            'logo'=>'logo.jpg',
            'address'=>"Số 3 Cầu Giấy , Láng Hạ , Hà Nội",
            'email'=>"eshop@gmail.com",
            'phone'=>"+84394612672",
        );
        DB::table('settings')->insert($data);
    }
}
