create database mySQL3;
use mySQL3;
create table vattu
(
    id        int not null primary key auto_increment,
    mavattu   int not null,
    tenvattu  varchar(100),
    donvitinh varchar(100),
    giatien   double
);
alter table vattu
    modify column mavattu varchar(100);
create table tonkho
(
    id              int not null primary key auto_increment,
    soluongdau      int,
    tongsoluongnhap int,
    tongsoluongxuat int,
    vattu_id        int,
    foreign key (vattu_id) references vattu (id)
);
create table nhacungcap
(
    id            int not null primary key auto_increment,
    id_nhacungcap int,
    tennhacungcap varchar(100),
    diachi        varchar(100),
    sodienthoai   int
);
create table dondathang
(
    id            int not null primary key auto_increment,
    madon         int,
    ngaydathang   date,
    nhacungcap_id int,
    foreign key (nhacungcap_id) references nhacungcap (id)
);
create table phieunhap
(
    id          int not null primary key auto_increment,
    maphieunhap int,
    ngaynhap    date,
    donhang_id  int,
    foreign key (donhang_id) references dondathang (id)
);
create table phieuxuat
(
    id           int not null primary key auto_increment,
    maphieuxuat  int,
    ngayxuat     date,
    tenkhachhang varchar(100)
);
create table chitietdonhang
(
    id         int not null primary key auto_increment,
    donhang_id int,
    vattu_id   int,
    soluongdat int,
    foreign key (donhang_id) references dondathang (id),
    foreign key (vattu_id) references vattu (id)
);
create table chitietphieunhap
(
    id           int not null primary key auto_increment,
    phieunhap_id int,
    vattu_id     int,
    soluongnhap  int,
    dongianhap   double,
    ghichu       varchar(100),
    foreign key (phieunhap_id) references phieunhap (id),
    foreign key (vattu_id) references vattu (id)
);
create table chitietphieuxuat
(
    id           int not null primary key auto_increment,
    phieuxuat_id int,
    vattu_id     int,
    soluongxuat  int,
    dongiaxuat   int,
    foreign key (phieuxuat_id) references phieuxuat (id),
    foreign key (vattu_id) references vattu (id)
);
insert into vattu(id, mavattu, tenvattu, donvitinh, giatien) value
    (1, 'VT01', 'XiMang', 'bao', 75000),
    (2, 'VT02', 'Cat', 'bao', 50000),
    (3, 'VT03', 'Soi', 'bao', 40000),
    (4, 'VT04', 'Thep', 'Thanh', 10000),
    (5, 'VT05', 'Gach', 'vien', 5000);
insert into nhacungcap(id, id_nhacungcap, tennhacungcap, diachi, sodienthoai) value
    (1, 1, 'ctyA', 'HaNoi', 0989123123),
    (2, 2, 'ctyB', 'HaNoi', 0989123124),
    (3, 3, 'ctyC', 'HaNoi', 0989123125);
insert into dondathang(id, madon, ngaydathang, nhacungcap_id) value
    (1, 1, '2021-05-15', 1),
    (2, 2, '2021-05-16', 2),
    (3, 3, '2021-05-17', 3);
insert into tonkho(id, soluongdau, tongsoluongnhap, tongsoluongxuat, vattu_id) value
    (1, 100, 5, 6, 1),
    (2, 200, 4, 7, 2),
    (3, 150, 3, 8, 3),
    (4, 1000, 50, 10, 4),
    (5, 2000, 100, 10, 5),
    (6, 100, 6, 4, 1),
    (7, 100, 7, 2, 2),
    (8, 100, 8, 3, 3),
    (9, 1500, 50, 400, 4),
    (10, 1800, 100, 500, 5);
insert into phieunhap(id, maphieunhap, ngaynhap, donhang_id) value
    (1, 1, '2021-05-15', 1),
    (2, 2, '2021-05-16', 2),
    (3, 3, '2021-05-17', 3);
insert into phieuxuat(id, maphieuxuat, ngayxuat, tenkhachhang) value
    (1, 1, '2021-05-15', 'NguyenVanA'),
    (2, 2, '2021-05-16', 'NguyenVanB'),
    (3, 3, '2021-05-17', 'NguyenVanC');
insert into chitietdonhang(id, donhang_id, vattu_id, soluongdat) value
    (1, 1, 1, 10),
    (2, 2, 2, 3),
    (3, 3, 3, 5),
    (4, 1, 4, 6),
    (5, 2, 5, 8),
    (6, 3, 1, 2);

insert into chitietphieunhap(id, phieunhap_id, vattu_id, soluongnhap, dongianhap, ghichu) value
    (1, 1, 1, 5, 75000, 'DaTT'),
    (2, 2, 2, 3, 100000, 'DaTT'),
    (3, 3, 3, 4, 150000, 'DaTT'),
    (4, 1, 4, 7, 200000, 'DaTT'),
    (5, 2, 5, 8, 500000, 'DaTT'),
    (6, 3, 1, 9, 50000, 'DaTT');
alter table chitietphieuxuat
    add column ghichu varchar(100);
insert into chitietphieuxuat(id, phieuxuat_id, vattu_id, soluongxuat, dongiaxuat, ghichu) value
    (1, 1, 1, 5, 600000, 'DaTT'),
    (2, 2, 2, 3, 500000, 'DaTT'),
    (3, 3, 3, 4, 700000, 'DaTT'),
    (4, 1, 4, 6, 800000, 'DaTT'),
    (5, 2, 5, 7, 900000, 'DaTT'),
    (6, 3, 1, 8, 400000, 'DaTT');

# Dữ liệu bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền.

select maphieunhap, mavattu, soluongnhap, dongianhap, giatien
from vattu
         join chitietphieunhap c on vattu.id = c.vattu_id
         join phieunhap p on p.id = c.phieunhap_id;

# số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.

select maphieunhap, mavattu, tenvattu, soluongnhap, dongianhap, (soluongnhap * dongianhap) as thanhtiennhap
from vattu
         join chitietphieunhap c on vattu.id = c.vattu_id
         join phieunhap p on p.id = c.phieunhap_id;


# số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.


select maphieunhap,
       ngaynhap,
       soluongdat,
       mavattu,
       tenvattu,
       soluongnhap,
       dongianhap,
       (soluongnhap * dongianhap) as thanhtiennhap
from vattu
         join chitietphieunhap c on vattu.id = c.vattu_id
         join chitietdonhang c2 on c.vattu_id = c2.vattu_id
         join phieunhap p on p.id = c.phieunhap_id;

# số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã nhà cung cấp, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.

select maphieunhap,
       ngaynhap,
       soluongdat,
       nhacungcap_id,
       mavattu,
       tenvattu,
       soluongnhap,
       dongianhap,
       (soluongnhap * dongianhap) as thanhtiennhap
from vattu
         join chitietphieunhap c on vattu.id = c.vattu_id
         join phieunhap p on p.id = c.phieunhap_id
         join chitietdonhang c2 on c.vattu_id = c2.vattu_id
         join dondathang d on d.id = c2.donhang_id;

# số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập có số lượng nhập > 5.


select maphieunhap, ngaynhap, soluongnhap, dongianhap, (soluongnhap * dongianhap) as thanhtiennhap
from vattu
         join chitietphieunhap c on vattu.id = c.vattu_id
         join phieunhap p on p.id = c.phieunhap_id
where soluongnhap > 5;

# số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập vật tư có đơn vị tính là Bộ.


select maphieunhap, mavattu, tenvattu, soluongnhap, dongianhap, (soluongnhap * dongianhap) as thanhtiennhap
from vattu
         join chitietphieunhap c on vattu.id = c.vattu_id
         join phieunhap p on p.id = c.phieunhap_id
where donvitinh = 'bao';

# số phiếu xuất hàng, mã vật tư, số lượng xuất, đơn giá xuất, thành tiền xuất.


select maphieuxuat, mavattu, tenvattu, soluongxuat, dongiaxuat, (soluongxuat * dongiaxuat) as thanhtienxuat
from vattu
         join chitietphieuxuat c on vattu.id = c.vattu_id
         join phieuxuat p on p.id = c.phieuxuat_id;

# số phiếu xuất hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.

select maphieuxuat, mavattu, tenvattu, soluongxuat, dongiaxuat
from vattu
         join chitietphieuxuat c on vattu.id = c.vattu_id
         join phieuxuat p on p.id = c.phieuxuat_id;

# số phiếu xuất hàng, tên khách hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.

select maphieuxuat, tenkhachhang, mavattu, tenvattu, soluongxuat, dongiaxuat
from vattu
         join chitietphieuxuat c on vattu.id = c.vattu_id
         join phieuxuat p on p.id = c.phieuxuat_id;

# Câu 1. Tạo view có tên vw_CTPNHAP bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.

create view vw_CTPNHAP as
select maphieunhap, mavattu, soluongnhap, dongianhap, (soluongnhap * dongianhap) as thanhtiennhap
from vattu
         join chitietphieunhap c on vattu.id = c.vattu_id
         join phieunhap p on p.id = c.phieunhap_id;

# Câu 2. Tạo view có tên vw_CTPNHAP_VT bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.

create view vw_CTPNHAP_VT as
select maphieunhap, mavattu, tenvattu, soluongnhap, dongianhap, (soluongnhap * dongianhap) as thanhtiennhap
from vattu
         join chitietphieunhap c on vattu.id = c.vattu_id
         join phieunhap p on p.id = c.phieunhap_id;

# Câu 3. Tạo view có tên vw_CTPNHAP_VT_PN bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.

create view vw_CTPNHAP_VT_PN as
select maphieunhap,
       ngaynhap,
       soluongdat,
       mavattu,
       tenvattu,
       soluongnhap,
       dongianhap,
       (soluongnhap * dongianhap) as thanhtiennhap
from vattu
         join chitietphieunhap c on vattu.id = c.vattu_id
         join phieunhap p on p.id = c.phieunhap_id
         join chitietdonhang c2 on c.vattu_id = c2.vattu_id;

# Câu 4. Tạo view có tên vw_CTPNHAP_VT_PN_DH bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã nhà cung cấp, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.

create view vw_CTPNHAP_VT_PN_DH as
select maphieunhap,
       ngaynhap,
       soluongdat,
       nhacungcap_id,
       mavattu,
       tenvattu,
       soluongnhap,
       dongianhap,
       (soluongnhap * dongianhap) as thanhtiennhap
from vattu
         join chitietphieunhap c on vattu.id = c.vattu_id
         join phieunhap p on p.id = c.phieunhap_id
         join chitietdonhang c2 on c.vattu_id = c2.vattu_id
         join dondathang d on d.id = c2.donhang_id;

# Câu 5. Tạo view có tên vw_CTPNHAP_loc  bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập có số lượng nhập > 5.

create view vw_CTPNHAP_loc as
select maphieunhap, ngaynhap, soluongnhap, dongianhap, (soluongnhap * dongianhap) as thanhtiennhap
from vattu
         join chitietphieunhap c on vattu.id = c.vattu_id
         join phieunhap p on p.id = c.phieunhap_id
where soluongnhap > 5;

# Câu 6. Tạo view có tên vw_CTPNHAP_VT_loc bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập vật tư có đơn vị tính là Bộ.

create view vw_CTPNHAP_VT_loc as
select maphieunhap, mavattu, tenvattu, soluongnhap, dongianhap, (soluongnhap * dongianhap) as thanhtiennhap
from vattu
         join chitietphieunhap c on vattu.id = c.vattu_id
         join phieunhap p on p.id = c.phieunhap_id
where donvitinh = 'bao';

# Câu 7. Tạo view có tên vw_CTPXUAT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, số lượng xuất, đơn giá xuất, thành tiền xuất.

create view vw_CTPXUAT as
select maphieuxuat, mavattu, tenvattu, soluongxuat, dongiaxuat, (soluongxuat * dongiaxuat) as thanhtienxuat
from vattu
         join chitietphieuxuat c on vattu.id = c.vattu_id
         join phieuxuat p on p.id = c.phieuxuat_id;

# Câu 8. Tạo view có tên vw_CTPXUAT_VT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.

create view vw_CTPXUAT_VT as
select maphieuxuat, mavattu, tenvattu, soluongxuat, dongiaxuat
from vattu
         join chitietphieuxuat c on vattu.id = c.vattu_id
         join phieuxuat p on p.id = c.phieuxuat_id;

# Câu 9. Tạo view có tên vw_CTPXUAT_VT_PX bao gồm các thông tin sau: số phiếu xuất hàng, tên khách hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.

create view vw_CTPXUAT_VT_PX as
select maphieuxuat, tenkhachhang, mavattu, tenvattu, soluongxuat, dongiaxuat
from vattu
         join chitietphieuxuat c on vattu.id = c.vattu_id
         join phieuxuat p on p.id = c.phieuxuat_id;

# Câu 1. Tạo Stored procedure (SP) cho biết tổng số lượng cuối của vật tư với mã vật tư là tham số vào

create procedure tong_vattu (in mavattu1 varchar(100))
begin
select (soluongdau+tongsoluongnhap-tongsoluongxuat) from tonkho
                                                             join vattu v on v.id = tonkho.vattu_id
where mavattu = mavattu1;
end;
call tong_vattu('VT01');

# Tạo SP cho biết tổng tiền xuất của vật tư với mã vật tư là tham số vào

create procedure tong_tienxuat (in mavattu1 varchar(100))
begin
select dongiaxuat from chitietphieuxuat
                           join vattu v on chitietphieuxuat.vattu_id = v.id
where mavattu = mavattu1;
end;
call tong_tienxuat('VT01');

# Tạo SP cho biết tổng số lượng đặt theo số đơn hàng với số đơn hàng là tham số vào

create procedure tongdat_theodonhang (in sodonhang int)
begin
select donhang_id from chitietdonhang
where donhang_id = sodonhang;
end;
call tongdat_theodonhang(1);

# Tạo SP dùng để thêm một đơn đặt hàng

create procedure themdondathang (in id1 int, madon1 int, ngaydathang1 date, nhacungcap_id1 int)
begin
    insert dondathang(id, madon, ngaydathang, nhacungcap_id) values
    (id1,madon1,ngaydathang1,nhacungcap_id1);
end;
call themdondathang(4,4,'2021-05-20',3);

# Câu 5. Tạo SP dùng để thêm một chi tiết đơn đặt hàng

create procedure themchitietdondathang (in id1 int, donhang_id1 int, vattu_id1 int, soluongdat1 int)
begin
    insert chitietdonhang(id, donhang_id, vattu_id, soluongdat) value
    (id1,donhang_id1,vattu_id1,soluongdat1);
end;
call themchitietdondathang(7,2,2,5);